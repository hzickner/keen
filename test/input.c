#include <id_heads.h>

int main(void)
{
	IN_Startup();
	while (!Keyboard[46]) {};
	IN_Shutdown();
	return(0);
}	