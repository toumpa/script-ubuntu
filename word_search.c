#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[])
{

    FILE *fp;
    char temp[100], str[100], *token, s[2]=" ";
    int a, b, c;

    if (argc != 5)
    {
        fprintf(stderr, "Wrong number of arguments...\n");
        return 1;
    }

    fp = fopen(argv[1], "r");
    if(fp == NULL)
    {
        fprintf(stderr, "Failed to open file...\n");
        return 1;
    }

    while(!feof(fp))
    {
        fgets(str, 100, fp);
        
        a=0; b=0; c=0;
        memset(temp, '\0', sizeof(temp));
        strcpy(temp, str);
        token = strtok(temp, s);
        while(token != NULL)
        {
            if(!strcmp(token, argv[2])) {
                a=1;
            }
            if(a && !strcmp(token, argv[3])) {
								b=1;
            }
            if(b && !strcmp(token, argv[4])) {
								c=1;
            }
            
            token = strtok(NULL, s);
        }
        if(a && b && c)
            printf("%s", str);
    }

    fclose(fp);

    return 0;
}
