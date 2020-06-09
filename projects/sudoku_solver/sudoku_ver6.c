/*
Author: Ankit Arora
Roll Number: MT2014007
Title: Sudoku Solver
Complexity: O((N*N)^5) where N>=3 and N<=10
Task: To solve a given sudoku for N>=3 and N<=10 

	Implemented various techniques including cross-hatching and 4 other rules:
	
	Rule1: Single Candidate Square - When a square has just one candidate, that number goes into the square.
	Rule2: Single Square Candidate - When a candidate number appears just once in an area (box), that number goes into the square.
	Rule3: Pairing - When two squares in the same area (row, column or box) have identical two-number candidate lists, you can remove both numbers from other candidate lists in that area.
	Rule4: Groupings for n>=3 and n<6 (Includes triples, quadruples, etc.).
	
	Input:
	
	3
	0 0 0 0 0 0 0 1 0
	0 0 2 0 0 1 9 0 7
	7 9 0 0 5 2 0 0 0
	0 0 6 0 0 0 0 7 5
	0 0 0 6 0 8 0 0 0
	3 2 0 0 0 0 8 0 0
	0 0 0 4 8 0 0 9 3
	8 0 3 1 0 0 5 0 0
	0 5 0 0 0 0 0 0 0
	
	Output:
	5 4 8 7 9 6 3 1 2 
	6 3 2 8 4 1 9 5 7 
	7 9 1 3 5 2 4 6 8 
	1 8 6 9 3 4 2 7 5 
	4 7 5 6 2 8 1 3 9 
	3 2 9 5 1 7 8 4 6 
	2 1 7 4 8 5 6 9 3 
	8 6 3 1 7 9 5 2 4 
	9 5 4 2 6 3 7 8 1
*/
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define MAX_SIZE 100

//Global Variables declaration
int global;

struct cell
{
	int data;
	struct cell *next;
};
 
int arr[MAX_SIZE][MAX_SIZE];
int missing_num[MAX_SIZE][MAX_SIZE];
struct cell* candidates[MAX_SIZE][MAX_SIZE];
int count_cand[MAX_SIZE][MAX_SIZE];
int pairing_check[MAX_SIZE][MAX_SIZE];
int mark[MAX_SIZE][MAX_SIZE];

//Function declaration
void add_candidate(struct cell **,int,int,int);
int check_pair(int,int,int,int,int);
void remove_from_box(int,int,int,int,int,int,int,int);
void remove_from_row(int,int,int,int,int,int);
void remove_from_col(int,int,int,int,int,int);
int match(int *,int,int,int,int);
int match_possible(int *,int,int,int,int,int);
void mark_groupings(int,int,int);
void mark_groupings_row(int,int);
void mark_groupings_col(int,int);
void mark_zero(int,int,int);
void mark_zero_row(int,int);
void mark_zero_col(int,int);
void mark_2(int,int);
void mark_2_col(int,int);
void mark_2_box(int,int,int);
void mark_zero_rule4b(int,int);
void mark_zero_rule4b_col(int,int);
void mark_zero_rule4b_box(int,int,int);
void removefrombox(int *,int,int,int,int);
void removefromcol(int *,int,int,int);
void removefromrow(int *,int,int,int);

//techniques
void cross_hatching(int);
void find_candidates(int);
void rule1(int);
void rule2(int);
void rule2_row(int);
void rule2_col(int);
void rule3_box(int);
void rule3_row(int);
void rule3_col(int);
void rule4a_box(int,int);
void rule4a_row(int,int);
void rule4a_col(int,int);
void rule4b_row(int,int);
void rule4b_col(int,int);
void rule4b_box(int,int);

//Main function
void main()
{
	//declaration for crosshatching
	int i,j,k,l,m,N,count1,count2,number,possible_count=0,loc_col,loc_row,candidate_count=0,recent=0,p,q,total_count=0,recent_total_count=0;

	
	//declaration for pencilling in
	struct cell *temp,*list;
	int data;
	
	global=0;
	
	//input of size from the user
	scanf("%d",&N);

	//for crosshatching
	memset(missing_num,0,sizeof(int)*(N*N)*(N*N));
	
	//for pencilling in
	memset(count_cand,0,sizeof(int)*(N*N)*(N*N));

	//initialization for pencilling in
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			candidates[i][j]=NULL;
		}
	}

	//input from the user	
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			scanf("%d",&arr[i][j]);
			if(arr[i][j]!=0)
			{
				global++;
			}
		}
	}

	//finding the missing numbers for each box
	count1=0;
	count2=0;
	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if(arr[j][k]!=0)
				{
					missing_num[i][arr[j][k]-1]=1;
				}
			}
		}
		count2=count2+N;
	}

	//printf("%d\n",global);
	//finding the possibilities for each cell and place the appropriate number via crosshatching.
	cross_hatching(N);

	//pencilling in
	find_candidates(N);

	//Apply various rules
	//Rule 1 - Single candidate square
	recent=0;
	while(recent!=global && global!=N*N*N*N)
	{
		recent=global;
		rule1(N);
	}
	//Rule 2 - Single square candidates
	recent=0;
	while(recent!=global && global!=N*N*N*N)
	{
		recent=global;
		rule2(N);
		rule2_row(N);
		rule2_col(N);
	}
	
	//Rule 3 - Pairing and Rule 4 - Grouping(triples,quadruples,etc.)

	recent=0;
	while(recent!=global && global!=N*N*N*N)
	{
		recent=global;
		rule3_box(N);
		rule3_row(N);
		rule3_col(N);
		for(i=3;i<6;i++)
		{
			rule4a_box(N,i);
			rule4a_row(N,i);
			rule4a_col(N,i);
			rule4b_box(N,i);
			rule4b_row(N,i);
			rule4b_col(N,i);
		}
		rule1(N);
		rule2(N);
		rule2_row(N);
		rule2_col(N);
	}
	//cross_hatching(N);
	//printing the result
	//printf("result\n");
	//printf("\n");
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			printf("%d ",arr[i][j]);
		}
		printf("\n");
	}
	//printf("%d\n",global);
}

//Function 1: Add candidates to the beginning of linked list
void add_candidate(struct cell **head,int data,int i,int j)
{
	struct cell *temp = (struct cell *)malloc(sizeof(struct cell)); 
	temp->data=data;
	temp->next=NULL;
	
	if(*head==NULL)
	{
		*head=temp;
	}
	else
	{
		temp->next=*head;
		*head=temp;
	}
}

//Function2: Matching the elements of all pairs - call from rule3
int check_pair(int j,int k,int y,int z,int N)
{
	int count=0;
	int cand1,cand2,cand3,cand4;
	cand1=candidates[j][k]->data;
	cand2=candidates[j][k]->next->data;
	cand3=candidates[y][z]->data;
	cand4=candidates[y][z]->next->data;
	if(cand1==cand3)
		count++;
	if(cand1==cand4)
		count++;
	if(cand2==cand3)
		count++;
	if(cand2==cand4)
		count++;
	if(count==2)
		return 1;
	else
		return 0;
}

//Function3: Remove all the elements from box under consideration that are involved in pairing - call from rule3
void remove_from_box(int i,int j,int y,int z,int count1,int count2,int N,int candidate)
{
int p,q;
struct cell *list;
struct cell *temp;
	for(p=count1;p<count1+N;p++)
	{
		for(q=count2;q<count2+N;q++)
		{
			if(count_cand[p][q]>1)
			{
				if(((p==i)&&(q==j))||((p==y)&&(q==z)))	
				{
				}
				else
				{
					list=candidates[p][q];
					if(list->next==NULL)
					{
						if(list->data==candidate)
						{
							candidates[p][q]=NULL;
							count_cand[p][q]-=1;
						}
					}
					else if((list->next!=NULL)&&(list->data==candidate))
					{
						candidates[p][q]=list->next;
						count_cand[p][q]-=1;
					}
					else
					{
						temp=candidates[p][q]->next;
						while(temp!=NULL)
						{
							if(temp->data==candidate)
							{
								list->next=temp->next;
								count_cand[p][q]-=1;
								break;
							}
							temp=temp->next;
							list=list->next;
						}
					}
				}	
			}
		}
	}
}


//Function4: Remove all the elements from row under consideration that are involved in pairing - call from rule3
void remove_from_row(int i,int j,int y,int z,int N,int candidate)
{
	int k;
	struct cell *list;
	struct cell *temp;
	for(k=0;k<(N*N);k++)
	{
		if((count_cand[i][k]>1)&&(k!=j))
		{
			if((i==y)&&(k==z))
			{
			}
			else
			{
				list=candidates[i][k];
				if(list->next==NULL)
				{
					if(list->data==candidate)
					{
						candidates[i][k]=NULL;
						count_cand[i][k]-=1;
					}
				}
				else if((list->next!=NULL)&&(list->data==candidate))
				{
					candidates[i][k]=list->next;
					count_cand[i][k]-=1;
				}
				else
				{
					temp=candidates[i][k]->next;
					while(temp!=NULL)
					{
						if(temp->data==candidate)
						{
							list->next=temp->next;
							count_cand[i][k]-=1;
							free(temp);
							temp=NULL;
							break;
						}
						else
						{
							list=temp;
							temp=temp->next;
						}
					}
				}
			}
		}	
	}
}

//Function5: Remove all the elements from column under consideration that are involved in pairing - call from rule3
void remove_from_col(int i,int j,int y,int z,int N,int candidate)
{
	int k;
	struct cell *list;
	struct cell *temp;
	for(k=0;k<N*N;k++)
	{
		if((count_cand[k][j]>1)&&(k!=i))
		{
			if((k==y)&&(j==z))
			{
			}
			else
			{
				list=candidates[k][j];
				if(list->next==NULL)
				{
					if(list->data==candidate)
					{
						candidates[k][j]=NULL;
						count_cand[k][j]-=1;
					}
				}
				else if((list->next!=NULL)&&(list->data==candidate))
				{
					candidates[k][j]=list->next;
					count_cand[k][j]-=1;
				}
				else
				{
					temp=candidates[k][j]->next;
					while(temp!=NULL)
					{
						if(temp->data==candidate)
						{
							list->next=temp->next;
							count_cand[k][j]-=1;
							free(temp);
							temp=NULL;
							break;
						}
						else
						{
							list=temp;
							temp=temp->next;
						}
					}
				}
			}
		}	
	}
}

//Function6: possible candidate array list to be compared with all candidates of a cell - call from rule4a
int match(int *possible_cand,int N,int p,int q,int count)
{
	struct cell* list;
	int i;
	int cand_count=0;
	list=candidates[p][q];
	for(i=0;i<N;i++)
	{
		list=candidates[p][q];
		while(list!=NULL)
		{
			if(possible_cand[i]==list->data)
				cand_count++;
			list=list->next;
		}
	}
	if(cand_count==count_cand[p][q])
	{
		mark[p][q]=-1;
		count++;
	}
	return count;
}

//Function7 called by rule 4b: possible candidate array list to be compared with all candidates of a cell.
int match_possible(int *possible_cand,int j,int q,int N,int p,int M)
{
	struct cell* list;
	int i,y,k,flag=0;
	int cand_count=0;
	int *cand;
	cand=(int *)malloc(sizeof(int)*M);
	list=candidates[j][q];
	while(list!=NULL)
	{
		for(i=0;i<M;i++)
		{
			if(possible_cand[i]==list->data)
			{
				flag=1;
			}
		}
	
		if(flag!=1)
		{
			cand[cand_count]=list->data;
			cand_count++;
		}
		else
			flag=0;
		list=list->next;
	}
	if(cand_count<=M-p)
	{
		k=0;
		for(i=p;i<p+cand_count;i++)
		{
			possible_cand[i]=cand[k];
			k++;
		}
		return p+cand_count;
	}
	else
		return 0;
}

//Function8: mark -1 to 2 (boxwise) - call from rule 4b
void mark_groupings(int count1,int count2,int N)
{
	int i,j;
	for(i=count1;i<count1+N;i++)
	{
		for(j=count2;j<count2+N;j++)
		{
			if(mark[i][j]==-1)
			{
				mark[i][j]=2;
			}
		}
	}
}

//Function9: mark -1 to 2 (rowwise) - call from rule 4b 
void mark_groupings_row(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[i][j]==-1)
		{
			mark[i][j]=2;
		}
	}
}

//Function10: mark -1 to 2 (columnwise) - call from rule 4b
void mark_groupings_col(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[j][i]==-1)
		{
			mark[j][i]=2;
		}
	}
}

//Function11: mark -1 to 0 (boxwise) - call from rule 3
void mark_zero(int count1,int count2,int N)
{
	int i,j;
	for(i=count1;i<count1+N;i++)
	{
		for(j=count2;j<count2+N;j++)
		{
			if(mark[i][j]==-1)
			{
				mark[i][j]=0;
			}
		}
	}
}

//Function12: mark -1 to 0 (rowwise)
void mark_zero_row(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[i][j]==-1)
		{
			mark[i][j]=0;
		}
	}
}

//Function13: mark -1 to 0 (columnwise)
void mark_zero_col(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[j][i]==-1)
		{
			mark[j][i]=0;
		}
	}
}

//Function14: mark all negatives except -(N+1) to 2 (rowwise)
void mark_2(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[i][j]<0 && mark[i][j]!=-(N+1))
		{
			mark[i][j]=2;
		}
	}
}

//Function15: mark all negatives except -(N+1) to 2 (columnwise)
void mark_2_col(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[j][i]<0 && mark[j][i]!=-(N+1))
		{
			mark[j][i]=2;
		}
	}
}

//Function16: mark all negatives except -(N+1) to 2 (boxwise)
void mark_2_box(int count1,int count2,int N)
{
	int i,j;
	for(i=count1;i<count1+N;i++)
	{
		for(j=count2;j<count2+N;j++)
		{
			if(mark[i][j]<0 && mark[i][j]!=-(N+1))
			{
				mark[i][j]=2;
			}
		}
	}
}

//Function17: mark all negatives except -(N+1) to 0 (rowwise)
void mark_zero_rule4b(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[i][j]<0 && mark[i][j]!=-(N+1))
		{
			mark[i][j]=0;
		}
	}
}

//Function18: mark all negatives except -(N+1) to 0 (columnwise)
void mark_zero_rule4b_col(int i,int N)
{
	int j;
	for(j=0;j<N*N;j++)
	{
		if(mark[j][i]<0 && mark[j][i]!=-(N+1))
		{
			mark[j][i]=0;
		}
	}
}

//Function19: mark all negatives except -(N+1) to 0 (boxwise)
void mark_zero_rule4b_box(int count1,int count2,int N)
{
	int i,j;
	for(i=count1;i<count1+N;i++)
	{
		for(j=count2;j<count2+N;j++)
		{
			if(mark[i][j]<0 && mark[i][j]!=-(N+1))
			{
				mark[i][j]=0;
			}
		}
	}
}

//Function20: remove elements in possible candidates list from box except the one marked 2 or 1 candidate list.
void removefrombox(int *possible_cand,int count1,int count2,int N,int M)
{
	int p,q,y,candidate;
	struct cell *list;
	struct cell *temp;
	for(p=count1;p<count1+N;p++)
	{
		for(q=count2;q<count2+N;q++)
		{
			if((count_cand[p][q]>1)&&(mark[p][q]!=2))
			{
				for(y=0;y<M;y++)
				{
					candidate=possible_cand[y];	
					list=candidates[p][q];
					if(list!=NULL)
					{
						if(list->next==NULL)
						{
							if(list->data==candidate)
							{
								candidates[p][q]=NULL;
								count_cand[p][q]-=1;
							}
						}
						else if((list->next!=NULL)&&(list->data==candidate))
						{
							candidates[p][q]=list->next;
							count_cand[p][q]-=1;
						}
						else
						{
							temp=candidates[p][q]->next;
							while(temp!=NULL)
							{
								if(temp->data==candidate)
								{
									list->next=temp->next;
									count_cand[p][q]-=1;
									break;
								}
								temp=temp->next;
								list=list->next;
							}
						}	
					}
				}	
			}
		}
	}
}

//Function21: remove elements in possible candidates list from column except the one marked 2 or with 1 candidate list.
void removefromcol(int *possible_cand,int j,int N,int M)
{
	int k,y;
	struct cell *list;
	struct cell *temp;
	int candidate;
	for(k=0;k<N*N;k++)
	{
		if((count_cand[k][j]>1)&&(mark[k][j]!=2))
		{
			for(y=0;y<M;y++)
			{
				candidate=possible_cand[y];	
				list=candidates[k][j];
				if(list->next==NULL)
				{
					if(list->data==candidate)
					{
						candidates[k][j]=NULL;
						count_cand[k][j]-=1;
					}
				}
				else if((list->next!=NULL)&&(list->data==candidate))
				{
					candidates[k][j]=list->next;
					count_cand[k][j]-=1;
				}
				else
				{
					temp=candidates[k][j]->next;
					while(temp!=NULL)
					{
						if(temp->data==candidate)
						{
							list->next=temp->next;
							count_cand[k][j]-=1;
							free(temp);
							temp=NULL;
							break;
						}
						else
						{
						list=temp;
						temp=temp->next;
						}
					}
				}
			}
		}	
	}
}

//Function22: remove elements in possible candidates list from row except the one marked 2 or 1 candidate list.
void removefromrow(int *possible_cand,int i,int N,int M)
{
	int k,y;
	struct cell *list;
	struct cell *temp;
	int candidate;
	for(k=0;k<(N*N);k++)
	{
		if((count_cand[i][k]>1)&&(mark[i][k]!=2))
		{
			for(y=0;y<M;y++)
			{
				candidate=possible_cand[y];	
				list=candidates[i][k];
				if(list->next==NULL)
				{
					if(list->data==candidate)
					{
						candidates[i][k]=NULL;
						count_cand[i][k]-=1;
					}
				}
				else if((list->next!=NULL)&&(list->data==candidate))
				{
					candidates[i][k]=list->next;
					count_cand[i][k]-=1;
				}
				else
				{
					temp=candidates[i][k]->next;
					while(temp!=NULL)
					{
						if(temp->data==candidate)
						{
							list->next=temp->next;
							count_cand[i][k]-=1;
							free(temp);
							temp=NULL;
							break;
						}
						else
						{
							list=temp;
							temp=temp->next;
						}
					}
				}
			}
		}	
	}
}

//Function23: Crosshatching - 1st technique for solving easy problems.
void cross_hatching(int N)
{
	int recent=0,count1,count2,i,j,k,l,m,possible_count=0,loc_row=0,loc_col=0,candidate_count=0,number;
	while(recent!=global)
	{
		recent=global;
		count1=0;
		count2=0;
		for(i=0;i<N*N;i++)
		{
			if(i%N==0 && i!=0)
			{
				count1=count1+N;
				count2=0;
			}
			for(l=0;l<N*N;l++)
			{
				if(missing_num[i][l]==0)
				{
					number=l+1;
					candidate_count=0;
					for(j=count1;j<count1+N;j++)
					{
						for(k=count2;k<count2+N;k++)
						{
							if(arr[j][k]==0)
							{
								//row check
								for(m=0;m<N*N;m++)
								{
									if(arr[j][m]==number)
									{
										possible_count++;
									}
								}
								//column check
								for(m=0;m<N*N;m++)
								{
									if(arr[m][k]==number)
									{
										possible_count++;
									}
								}
								if(possible_count==0)
								{
									loc_row=j;
									loc_col=k;
									candidate_count++;
								}
								possible_count=0;
							}	
						}
					}
					if(candidate_count==1)
					{
						arr[loc_row][loc_col]=number;
						missing_num[i][l]=1;
						global++;
					}
				}
			}
			count2=count2+N;
		}
	}
}

//Function24: Pencilling in - technique to add possible candidates to all the respective cells in the sudoku.
void find_candidates(int N)
{
	int i,j,k,l,m,count1,count2,possible_count,number;
	count1=0;
	count2=0;
	possible_count=0;
	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(l=0;l<N*N;l++)
		{
			if(missing_num[i][l]==0)
			{
				number=l+1;
				for(j=count1;j<count1+N;j++)
				{
					for(k=count2;k<count2+N;k++)
					{
						if(arr[j][k]==0)
						{
							//row check
							for(m=0;m<N*N;m++)
							{
								if(arr[j][m]==number)
								{
									possible_count++;
								}
							}
							//column check
							for(m=0;m<N*N;m++)
							{
								if(arr[m][k]==number)
								{
									possible_count++;
								}
							}
							if(possible_count==0)
							{
								add_candidate(&candidates[j][k],number,j,k);
								count_cand[j][k]+=1;
							}
							possible_count=0;
						}	
					}
				}
			}
		}
		count2=count2+N;
	}

}

//Function25: Rule1-Single Candidate Square (Applied boxwise)
void rule1(int N)
{
	int count1,count2,i,j,k,p,q;
	count1=0;
	count2=0;
	
	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if(count_cand[j][k]==1)
				{
					arr[j][k]=candidates[j][k]->data;
					candidates[j][k]=NULL;
					missing_num[i][arr[j][k]-1]=1;
					count_cand[j][k]=0;
					global++;
					remove_from_row(j,k,j,k,N,arr[j][k]);
					remove_from_box(j,k,j,k,count1,count2,N,arr[j][k]);
					remove_from_col(j,k,j,k,N,arr[j][k]);				
				}
			}
		}
		count2=count2+N;
	}
}

//Function26: Rule2-Single Square Candidate (Applied boxwise)
void rule2(int N)
{
	int count1,count2,i,j,k,z,y,p,q,flag=0;
	int temp[N*N];
	struct cell* list;
	
	count1=0;
	count2=0;
	
	for(i=0;i<N*N;i++)
	{
		for(z=0;z<N*N;z++)
		{
			temp[z]=0;
		}
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if(arr[j][k]==0)
				{
					list=candidates[j][k];
					while(list!=NULL)
					{
						temp[(list->data)-1]+=1;
						list=list->next;
					}
				}
			}
		}
		for(y=0;y<N*N;y++)
		{
			if(temp[y]==1)
			{
				for(j=count1;j<count1+N;j++)
				{
					for(k=count2;k<count2+N;k++)
					{
						if(candidates[j][k]!=NULL)
						{
							list=candidates[j][k];
							while(list!=NULL)
							{
								if((list->data)==y+1)
								{
									flag=1;
								}
								list=list->next;
							}
							if(flag==1)
							{
								arr[j][k]=y+1;
								candidates[j][k]=NULL;
								missing_num[i][arr[j][k]-1]=1;
								count_cand[j][k]=0;
								global++;
								remove_from_row(j,k,j,k,N,arr[j][k]);
								remove_from_box(j,k,j,k,count1,count2,N,arr[j][k]);
								remove_from_col(j,k,j,k,N,arr[j][k]);	
								flag=0;
							}
						}
					}
				}
			}
		}
		count2=count2+N;
	}
}

//Function27: Rule2-Single Square Candidate (Applied rowwise)
void rule2_row(int N)
{
	int count1,count2,i,j,k,z,y,p,q,flag=0;
	int temp[N*N];
	struct cell* list;
	
	count1=0;
	count2=0;
	
for(j=0;j<N*N;j++)
{
	for(z=0;z<N*N;z++)
	{
		temp[z]=0;
	}
	for(k=0;k<N*N;k++)
	{
		if(arr[j][k]==0)
		{
			list=candidates[j][k];
			while(list!=NULL)
			{
				temp[(list->data)-1]+=1;
				list=list->next;
			}
		}
	}
	for(y=0;y<N*N;y++)
	{
		if(temp[y]==1)
		{
			for(k=0;k<N*N;k++)
			{
				if(candidates[j][k]!=NULL)
				{
					list=candidates[j][k];
					while(list!=NULL)
					{
						if((list->data)==y+1)
						{
							flag=1;
						}
						list=list->next;
					}
					if(flag==1)
					{
						arr[j][k]=y+1;
						candidates[j][k]=NULL;
						i=(j/N)*N+(k/N);//finding the box number
						missing_num[i][arr[j][k]-1]=1;
						count_cand[j][k]=0;
						global++;
						count1=(j/N)*N;
						count2=(k/N)*N;
						remove_from_row(j,k,j,k,N,arr[j][k]);
						remove_from_box(j,k,j,k,count1,count2,N,arr[j][k]);
						remove_from_col(j,k,j,k,N,arr[j][k]);	
						flag=0;
					}
				}
			}
		}
	}
}
}

//Function28: Rule2-Single Square Candidate (Applied columnwise)
void rule2_col(int N)
{
	int count1,count2,i,j,k,z,y,p,q,flag=0;
	int temp[N*N];
	struct cell* list;
	
	count1=0;
	count2=0;
	
for(j=0;j<N*N;j++)
{
	for(z=0;z<N*N;z++)
	{
		temp[z]=0;
	}
	for(k=0;k<N*N;k++)
	{
		if(arr[k][j]==0)
		{
			list=candidates[k][j];
			while(list!=NULL)
			{
				temp[(list->data)-1]+=1;
				list=list->next;
			}
		}
	}
	for(y=0;y<N*N;y++)
	{
		if(temp[y]==1)
		{
			for(k=0;k<N*N;k++)
			{
				if(candidates[k][j]!=NULL)
				{
					list=candidates[k][j];
					while(list!=NULL)
					{
						if((list->data)==y+1)
						{
							flag=1;
						}
						list=list->next;
					}
					if(flag==1)
					{
						arr[k][j]=y+1;
						candidates[k][j]=NULL;
						i=(k/N)*N+(j/N);//finding the box number
						missing_num[i][arr[k][j]-1]=1;
						count_cand[k][j]=0;
						global++;
						count1=(k/N)*N;
						count2=(j/N)*N;
						remove_from_row(k,j,k,j,N,arr[k][j]);
						remove_from_box(k,j,k,j,count1,count2,N,arr[k][j]);
						remove_from_col(k,j,k,j,N,arr[k][j]);	
						flag=0;
					}
				}
			}
		}
	}
}
}

//Function29: Rule3-Pairing (Applied boxwise)
void rule3_box(int N)
{
	int count1,count2,i,j,k,p,q,y,z,cand1,cand2;
	int flag=0;
	count1=0;
	count2=0;
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			pairing_check[i][j]=0;
		}
	}
	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if((count_cand[j][k]==2)&&(pairing_check[j][k]==0))
				{
					for(y=count1;y<count1+N;y++)
					{
						for(z=count2;z<count2+N;z++)
						{
							if((y==j)&&(z==k))
							{
							}
							else
							{
							if(count_cand[y][z]==2)
							{
								flag=check_pair(j,k,y,z,N);
								if(flag==1)
								{
									pairing_check[j][k]=1;
									pairing_check[y][z]=1;
									cand1=candidates[j][k]->data;
									cand2=candidates[j][k]->next->data;
									remove_from_box(j,k,y,z,count1,count2,N,cand1);
									remove_from_box(j,k,y,z,count1,count2,N,cand2);
																
									j=count1;
								}
							}
							}
							if(flag==1)
								break;
						}
						if(flag==1)
							break;
					}
				}
				if(flag==1)
					break;
			}
		}
		count2=count2+N;
	}
}

//Function30: Rule3-Pairing (Applied rowwise)
void rule3_row(int N)
{
	int count1,count2,i,j,k,p,q,y,z,cand1,cand2;
	int flag=0;
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			pairing_check[i][j]=0;
		}
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			if((count_cand[i][j]==2)&&(pairing_check[i][j]==0))
			{
				for(k=0;k<N*N;k++)
				{
					if((count_cand[i][k]==2)&&(j!=k))
					{
						flag=check_pair(i,j,i,k,N);
						if(flag==1)
						{
							pairing_check[i][j]=1;
							pairing_check[i][k]=1;
							cand1=candidates[i][j]->data;
							cand2=candidates[i][j]->next->data;
							remove_from_row(i,j,i,k,N,cand1);
							remove_from_row(i,j,i,k,N,cand2);
						}
					}
					if(flag==1)
						break;
				}
			}
			if(flag==1)
				break;
		}
	}
}

//Function31: Rule3-Pairing (Applied columnwise)
void rule3_col(int N)
{
	int count1,count2,i,j,k,p,q,y,z,cand1,cand2;
	int flag=0;
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			pairing_check[i][j]=0;
		}
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			if((count_cand[j][i]==2)&&(pairing_check[j][i]==0))
			{
				for(k=0;k<N*N;k++)
				{
					if((count_cand[k][i]==2)&&(k!=j))
					{
						flag=check_pair(j,i,k,i,N);
						if(flag==1)
						{
							pairing_check[j][i]=1;
							pairing_check[k][i]=1;
							cand1=candidates[j][i]->data;
							cand2=candidates[j][i]->next->data;
							remove_from_col(j,i,k,i,N,cand1);
							remove_from_col(j,i,k,i,N,cand2);
						}
					}
					if(flag==1)
						break;
				}
			}
			if(flag==1)
				break;
		}
	}
}

//Function32: Rule4a- visible triple or more grouping (Applied boxwise) eg: 619,61 and 91
//1-cell under consideration
//2-grouping found (keeping track by the count==M-1)-make all -1 to 2 and specific cell under consideration to 2
//-1-temporarirly grouping under consideration - if at last count does not become M-1, turn all -1 to 0
void rule4a_box(int N,int M)
{
	int count1,count2,i,j,k,p,q,z;
	int *possible_cand;
	struct cell* list;
	int count=0;
	count1=0;
	count2=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}

	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if((count_cand[j][k]==M) && (mark[j][k]==0))
				{
					mark[j][k]=1;
					count=0;
					list=candidates[j][k];
					for(p=0;p<M;p++)
					{
						possible_cand[p]=0;
					}

					for(p=0;p<M;p++)
					{
						if(list!=NULL)
						{
							possible_cand[p]=list->data;
							list=list->next;
						}
					}
					for(p=count1;p<count1+N;p++)
					{
						for(q=count2;q<count2+N;q++)
						{
							if(count_cand[p][q]>1 && count_cand[p][q]<=M && mark[p][q]==0)
							{
								if(count<M-1)
									count=match(possible_cand,M,p,q,count);//N to M
								if(count==M-1)
								{
									mark[j][k]=2;
									//mark -1 to 2
									mark_groupings(count1,count2,N);		
								}
							}
						}
					}
					if(count<M-1)
					{
						//mark -1 to 0
						mark_zero(count1,count2,N);
					}
					//now remove from box where mark=2
					if(count==M-1)
					{
						for(p=count1;p<count1+N;p++)
						{
							for(q=count2;q<count2+N;q++)
							{
								if((mark[p][q]!=2)&&(count_cand[p][q]>1))
								{
									removefrombox(possible_cand,count1,count2,N,M);
								}
							}
						}
					}
				}
			}
		}
		count2=count2+N;
	}
}

//Function33: Rule4a- visible triple or more grouping (Applied rowwise) eg: 619,61 and 91
//1-cell under consideration
//2-grouping found (keeping track by the count==M-1)-make all -1 to 2 and specific cell under consideration to 2
//-1-temporarirly grouping under consideration - if at last count does not become M-1, turn all -1 to 0

void rule4a_row(int N,int M)
{
	int count1,count2,i,j,k,p,q;
	int *possible_cand;
	struct cell* list;
	int count=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}

	for(j=0;j<N*N;j++)
	{
		for(k=0;k<N*N;k++)
		{
			if((count_cand[j][k]==M) && (mark[j][k]==0))
			{
				mark[j][k]=1;
				count=0;
				list=candidates[j][k];
				for(p=0;p<M;p++)
				{
					possible_cand[p]=0;
				}
				for(p=0;p<M;p++)
				{
					if(list!=NULL)
					{
						possible_cand[p]=list->data;
						list=list->next;
					}
				}
				for(q=0;q<N*N;q++)
				{
					if(count_cand[j][q]>1 && count_cand[j][q]<=M && mark[j][q]==0)
					{
						if(count<M-1)
							count=match(possible_cand,M,j,q,count);//N to M
						if(count==M-1)
						{
							mark[j][k]=2;
							//mark -1 to 2
							mark_groupings_row(j,N);		
						}
					}
				}
				if(count<M-1)
				{
					//mark -1 to 0
					mark_zero_row(j,N);
				}
				//now remove row where mark=2
				if(count==M-1)
				{
					for(q=0;q<N*N;q++)
					{
						if((mark[j][q]!=2)&&(count_cand[j][q]>1))
						{
							removefromrow(possible_cand,j,N,M);
						}
					}
				}
			}
		}
	}
}

//Function34: Rule4a- visible triple or more grouping (Applied columnwise) eg: 619,61 and 91
//1-cell under consideration
//2-grouping found (keeping track by the count==M-1)-make all -1 to 2 and specific cell under consideration to 2
//-1-temporarirly grouping under consideration - if at last count does not become M-1, turn all -1 to 0

void rule4a_col(int N,int M)
{
	int count1,count2,i,j,k,p,q;
	int *possible_cand;
	struct cell* list;
	int count=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}
	for(j=0;j<N*N;j++)
	{
		for(k=0;k<N*N;k++)
		{
			if((count_cand[k][j]==M) && (mark[k][j]==0))
			{
				mark[k][j]=1;
				count=0;
				list=candidates[k][j];
				for(p=0;p<M;p++)
				{
					possible_cand[p]=0;
				}

				for(p=0;p<M;p++)
				{
					if(list!=NULL)
					{
						possible_cand[p]=list->data;
						list=list->next;
					}
				}
				for(q=0;q<N*N;q++)
				{
					if(count_cand[q][j]>1 && count_cand[q][j]<=M && mark[q][j]==0)
					{
						if(count<M-1)
							count=match(possible_cand,M,q,j,count);//N to M
						if(count==M-1)
						{
							mark[k][j]=2;
							//mark -1 to 2
							mark_groupings_col(j,N);		
						}
					}
				}
				if(count<M-1)
				{
					//mark -1 to 0
					mark_zero_col(j,N);
				}
				//now remove row where mark=2
				if(count==M-1)
				{
					for(q=0;q<N*N;q++)
					{
						if((mark[q][j]!=2)&&(count_cand[q][j]>1))
						{
							removefromcol(possible_cand,j,N,M);
						}
					}
				}
			}
		}
	}
}

//Function35: Rule4b- hidden triple or more grouping (Applied rowwise) eg: 69,61 and 91
void rule4b_row(int N,int M)
{
	int count1,count2,i,j,k,p,q,l,y,z,possible_count=0,flag=0;
	int *possible_cand;
	struct cell* list;
	int count=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}

	for(j=0;j<N*N;j++)
	{
		for(k=0;k<N*N;k++)
		{
			if((count_cand[j][k]>=2) && (count_cand[j][k]<M) && (mark[j][k]==0 || mark[j][k]==-(N+1)))
			{
				mark[j][k]=1;
				for(p=0;p<M;p++)
				{
					possible_cand[p]=0;
				}
				possible_count=0;
				for(q=0;q<(N*N);q++)
				{
					list=candidates[j][k];
					for(p=0;p<M;p++)
					{
						possible_cand[p]=0;
					}
					p=0;
					while(list!=NULL)
					{
						possible_cand[p]=list->data;
						list=list->next;
						p++;
					}
				
					if(count_cand[j][q]>=2 && count_cand[j][q]<M && mark[j][q]==0)
					{
						//return 0 for not possible cand, and p for candidates possible and put them in array
						p=match_possible(possible_cand,j,q,N,p,M);
				
						if(p==0)
						{
							//move on
						}
						else
						{
							//logic
							mark[j][q]=-N;
							possible_count=0;
							for(l=q+1;l<(N*N);l++)
							{
								if((count_cand[j][l]>=2) && (count_cand[j][l]<M) && (mark[j][l]==0) && (possible_count<=M-2))
								{
						//return 0 for not possible cand, and new p for candidates possible and put them in array
									flag=match_possible(possible_cand,j,l,N,p,M);
									
									if(flag==0)
									{
										//move on
									}
									else
									{
										//logic
										p=flag;
										mark[j][l]=-(N-1);
										possible_count++;
									}
								}
							}
							
							if(possible_count==M-2)
							{
								//grouping found
								mark[j][k]=2;
								//mark all negative numbers as 2 except -(N+1)
								mark_2(j,N);
								//remove from row candidates except the cell marked as 2
								removefromrow(possible_cand,j,N,M);
								//printf("row.remove");
							}
							else
							{
								mark[j][q]=-(N+1);
								//mark all -ve numbers except -(N+1) zero
								mark_zero_rule4b(j,N);
							}
						}
					}
				}
			}
		}
	}
}

//Function36: Rule4b- hidden triple or more grouping (Applied columnwise) eg: 69,61 and 91
void rule4b_col(int N,int M)
{
	int count1,count2,i,j,k,p,q,l,y,z,possible_count=0,flag=0;
	int *possible_cand;
	struct cell* list;
	int count=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}

	for(j=0;j<N*N;j++)
	{
		for(k=0;k<N*N;k++)
		{
			if((count_cand[k][j]>=2) && (count_cand[k][j]<M) && (mark[k][j]==0 || mark[k][j]==-(N+1)))
			{
				mark[k][j]=1;
				for(p=0;p<M;p++)
				{
					possible_cand[p]=0;
				}
				possible_count=0;
				for(q=0;q<(N*N);q++)
				{
					list=candidates[k][j];
					for(p=0;p<M;p++)
					{
						possible_cand[p]=0;
					}
					p=0;
					while(list!=NULL)
					{
						possible_cand[p]=list->data;
						list=list->next;
						p++;
					}
				
					if(count_cand[q][j]>=2 && count_cand[q][j]<M && mark[q][j]==0)
					{
						//return 0 for not possible cand, and p for candidates possible and put them in array
						p=match_possible(possible_cand,q,j,N,p,M);
					
						if(p==0)
						{
							//move on
						}
						else
						{
							//logic
							mark[q][j]=-N;
							possible_count=0;
							for(l=q+1;l<(N*N);l++)
							{
								if((count_cand[l][j]>=2) && (count_cand[l][j]<M) && (mark[l][j]==0) && (possible_count<=M-2))
								{
						//return 0 for not possible cand, and new p for candidates possible and put them in array
									flag=match_possible(possible_cand,l,j,N,p,M);
									
									if(flag==0)
									{
										//move on
									}
									else
									{
										//logic
										p=flag;
										mark[l][j]=-(N-1);
										possible_count++;
									}
								}
							}
							
							if(possible_count==M-2)
							{
								//grouping found
								mark[k][j]=2;
								//mark all negative numbers as 2 except -(N+1)
								mark_2_col(j,N);
								//remove from row candidates except the cell marked as 2
								removefromcol(possible_cand,j,N,M);
							}
							else
							{
								mark[q][j]=-(N+1);
								//mark all -ve numbers except -(N+1) zero
								mark_zero_rule4b_col(j,N);
							}
						}
					}
				}
			}
		}
	}
}

//Function37: Rule4b- hidden triple or more grouping (Applied boxwise) eg: 69,61 and 91
void rule4b_box(int N,int M)
{
	int count1,count2,i,j,k,p,q,r,l,m,y,z,possible_count=0,flag=0;
	int *possible_cand;
	struct cell* list;
	int count=0;

	count1=0;
	count2=0;
	possible_cand=(int *)malloc(sizeof(int)*M);
	for(i=0;i<M;i++)
	{
		possible_cand[i]=0;
	}
	for(i=0;i<N*N;i++)
	{
		for(j=0;j<N*N;j++)
		{
			mark[i][j]=0;
		}
	}	
	for(i=0;i<N*N;i++)
	{
		if(i%N==0 && i!=0)
		{
			count1=count1+N;
			count2=0;
		}
		for(j=count1;j<count1+N;j++)
		{
			for(k=count2;k<count2+N;k++)
			{
				if((count_cand[j][k]>=2) && (count_cand[j][k]<M) && (mark[j][k]==0 || mark[j][k]==-(N+1)))
				{
					mark[j][k]=1;
					for(p=0;p<M;p++)
					{
						possible_cand[p]=0;
					}
					possible_count=0;
					for(q=count1;q<count1+N;q++)
					{
						for(r=count2;r<count2+N;r++)
						{
							list=candidates[j][k];
							for(p=0;p<M;p++)
							{
								possible_cand[p]=0;
							}

							p=0;
							while(list!=NULL)
							{
								possible_cand[p]=list->data;
								list=list->next;
								p++;
							}
					
							if(count_cand[q][r]>=2 && count_cand[q][r]<M && mark[q][r]==0)
							{
								//return 0 for not possible cand, and p for candidates possible and put them in array
								p=match_possible(possible_cand,q,r,N,p,M);
								if(p==0)
								{
									//move on
								}
								else
								{
									//logic
									mark[q][r]=-N;
									possible_count=0;
									for(l=count1;l<count1+N;l++)
									{
										for(m=count2;m<count2+N;m++)
										{
											if((count_cand[l][m]>=2) && (count_cand[l][m]<M) && (mark[l][m]==0) && (possible_count<=M-2))
											{
											//return 0 for not possible cand, and new p for candidates possible and put them in array
												flag=match_possible(possible_cand,l,m,N,p,M);
												if(flag==0)
												{
													//move on
												}
												else
												{
													//logic
													p=flag;
													mark[l][m]=-(N-1);
													possible_count++;
												}
											}
										}
									}
									if(possible_count==M-2)
									{
										//grouping found
										mark[j][k]=2;
										//mark all negative numbers as 2 except -(N+1)
										mark_2_box(count1,count2,N);
										//remove from row candidates except the cell marked as 2
										removefrombox(possible_cand,count1,count2,N,M);
									}
									else
									{
										mark[q][r]=-(N+1);
										//mark all -ve numbers except -(N+1) zero
										mark_zero_rule4b_box(count1,count2,N);
									}
									
								}
							}
						}
					}
				}
			}
		}
		count2=count2+N;
	}
}
