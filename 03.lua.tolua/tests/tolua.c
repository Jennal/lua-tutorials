#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int cclog(lua_State *L){
	const char* str = luaL_checkstring(L, 1);
	printf("[LOG]: %s\n", str);
	return 0;
}

static const struct luaL_reg lib [] = {
   {"log", cclog},
   {NULL, NULL}
};

int luaopen_logger (lua_State *L) {
   luaL_openlib(L, "logger", lib, 0);
   return 1;
}