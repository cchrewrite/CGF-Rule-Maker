#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define MAXNUMSYM 128

int i,j,k,l,m,n,ls,p,q,r,u,v,w,lf,numsyml,numsymr;
FILE *infile;
FILE *outfile;
char x[2000][2000];
char tstr[2000],y[2000];
int fact[2000];
char sym[2000][1000];

int findid(char s[1000])
{
    int i;
    for (i=0;i<ls;++i)
    {
        if (strcmp(s,sym[i]) == 0) return i;
    }
    return -1;
}

int addsym(char s[1000])
{
    strcpy(sym[ls],s);
    ++ls;
    return (ls - 1);
}

int extractfact(char u[1000], char v[1000], int p)
{
    int i,j,k,q,tpos;
    char tstr[1000];
    if (v[p] == '\0')
    {
        printf("%s ==> %s\n",u,v);
        return 0;
    }
    if (v[p] == '(')
    {
        i = 1;
        q = p + 1;
        while (i != 0)
        {
            if (v[q] == '(') ++i;
            else if (v[q] == ')') --i;
            ++q;
        }
        for (j=p;j<q;++j)
        {
            tstr[j-p] = y[j];
        }
        tstr[q-p] = '\0';
        //tpos = findpos(tstr,u);
        
        
    }
    else ;
}

int main()
{
    infile = fopen("mid.txt","r");
    outfile = fopen("output.txt","w");
    strcpy(sym[0],"unknown");
    strcpy(sym[1],"==>");
    strcpy(sym[2],"(");
    strcpy(sym[3],")");
    strcpy(sym[4],"vble");
    ls = 5;
    
    l = 0;
    while (fgets(x[l],9999,infile)!=NULL)
    {
        ++l;
    }
    for (i=0;i<l;++i)
    {
        strcpy(y,x[i]);
        p = 0;
        q = 1;
        lf = 0;
        numsyml = 0;
        numsymr = -1;
        while (1)
        {
            if (p == strlen(y)) break;
            while (y[q] != '\n' && y[q] != ' ') ++q;
            for (j=p;j<q;++j)
            {
                tstr[j-p] = y[j];
            }
            tstr[q-p] = '\0';
            u = findid(tstr);
            if (u == -1) 
            {
                u = addsym(tstr);
            }
            else if (u == 1)
            {
                numsymr = 0;
            }
            fact[lf] = u;
            ++lf;
            p = q + 1;
            q = p + 1;
            if (numsymr == -1) ++ numsyml;
            else ++numsymr;
        }
        --numsymr;
        if (numsyml > MAXNUMSYM || numsymr > MAXNUMSYM)
        {
            printf("WARNING: %s is too long!\n", y);
            continue;
        }
        for (j=0;j<lf;++j)
        {
            fprintf(outfile,"%d",fact[j]);
            if (j+1 < lf) fprintf(outfile,",");
        }
        fprintf(outfile,"\n");
    }
    printf("N = %d.\n",ls);
    for (i=0;i<ls;++i) printf("%d:%s\n",i,sym[i]);
    fclose(infile);
    fclose(outfile);
}

