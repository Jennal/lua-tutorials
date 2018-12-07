#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#define NAME_POS "test.pos"

typedef struct pos{
	double x;
	double y;
}Pos;

int newPos(lua_State *L) {
	double x = luaL_checknumber(L, 1);
	double y = luaL_checknumber(L, 2);
	
	Pos* pos = (Pos*)lua_newuserdata(L, sizeof(Pos));
	luaL_getmetatable(L, NAME_POS);
	lua_setmetatable(L, -2);

	pos->x = x;
	pos->y = y;

	return 1;
}

int getX(lua_State *L) {
	Pos *a = (Pos *)luaL_checkudata(L, 1, NAME_POS);
	lua_pushnumber(L, a->x);

	return 1;
}

int getY(lua_State *L) {
	Pos *a = (Pos *)luaL_checkudata(L, 1, NAME_POS);
	lua_pushnumber(L, a->y);

	return 1;
}

int gc(lua_State *L) {
	Pos *a = (Pos *)luaL_checkudata(L, 1, NAME_POS);
	printf("userdata deleted: %p\n", a);
	
	return 0;
}

static const struct luaL_Reg lib[] = {
   {"new", newPos},
   {"getX", getX},
   {"getY", getY},
   {NULL, NULL}
};

static const struct luaL_Reg meta[] = {
   {"getX", getX},
   {"getY", getY},
   {"__gc", gc},
   {NULL, NULL}
};

int luaopen_pos(lua_State *L) {
	luaL_newmetatable(L, NAME_POS);
	lua_pushvalue(L, -1);
	lua_setfield(L, -2, "__index");
	luaL_register(L, NULL, meta);

	luaL_register(L, "pos", lib);

	return 1;
}