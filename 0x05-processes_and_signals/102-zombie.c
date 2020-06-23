#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
/**
 * infinite_while - waits forever
 *
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 * main - creates 5 child processes and then waits
 * Return: 0
 */
int main(void)
{
	int i, pid;

	while (i < 5)
	{
		pid = fork();
		if (pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
		i++;
	}
	infinite_while();
	return (0);
}
