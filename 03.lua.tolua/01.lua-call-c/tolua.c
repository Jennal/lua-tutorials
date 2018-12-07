#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int tolog(lua_State *L) {
	const char* str = luaL_checkstring(L, 1);
	printf("[LOG]: %s\n", str);

	return 0;
}

int towhere(lua_State *L) {
	int level = luaL_checkint(L, 1);
	luaL_where(L, level);

	return 1;
}

static const struct luaL_Reg lib [] = {
   {"log", tolog},
   {"where", towhere},
   {NULL, NULL}
};

int luaopen_logger (lua_State *L) {
   luaL_register(L, "logger", lib);
   
   return 1;
}