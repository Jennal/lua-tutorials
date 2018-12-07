#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

static void stackDump (lua_State *L, const char* prefix) {
  int top = lua_gettop(L);
  printf("%s(%d): ", prefix, top);

  for(int i=1; i<=top; i++) {
    int t = lua_type(L, i);
    switch (t) {
      case LUA_TSTRING: /* strings */ 
        printf("'%s'", lua_tostring(L, i)); 
        break;
      case LUA_TBOOLEAN: /* booleans */ 
        printf(lua_toboolean(L, i) ? "true" : "false"); 
        break;
      case LUA_TNUMBER: /* numbers */ 
        printf("%g", lua_tonumber(L, i)); 
        break;
      default: /* other values */ 
        printf("%s %p", lua_typename(L, t), lua_topointer(L, i)); 
        break;
    }

    printf(" "); /* put a separator */ 
  }

  printf("\n"); /* end the listing */ 
}

int load_local(lua_State *L)
{
  lua_Debug ar;
  lua_getstack(L, 0, &ar);
  const char* name = lua_getlocal(L, &ar, 1);
  printf("local name = %s\n", name);
  printf("local value = %s\n", luaL_checkstring(L, -1));

  return 0;
}

void load (char *filename, int *width, int *height)
{
  lua_State *L = lua_open();
  luaL_openlibs(L);

  if (luaL_loadfile(L, filename))
    luaL_error(L, "cannot run configuration file: %s",
      lua_tostring(L, -1));
  stackDump(L, "load file");

  if(lua_pcall(L, 0, 0, 0))
    luaL_error(L, "cannot run configuration file: %s",
      lua_tostring(L, -1));
  stackDump(L, "pcall");

  lua_getglobal(L, "width");
  stackDump(L, "get width");
  lua_getglobal(L, "height");
  stackDump(L, "get height");

  if (!lua_isnumber(L, -2))
    luaL_error(L, "`width' should be a number\n");
  if (!lua_isnumber(L, -1))
    luaL_error(L, "`height' should be a number\n");

  *width = (int)lua_tonumber(L, -2);
  stackDump(L, "to width");
  *height = (int)lua_tonumber(L, -1);
  stackDump(L, "to height");

  lua_pop(L, 1);
  stackDump(L, "lua_pop");
  lua_pop(L, 1);
  stackDump(L, "lua_pop");

  load_local(L);

  lua_close(L);
}



int main()
{
  int width=0;
  int height=0;

  load("config.lua", &width, &height);
  printf("w=%d, h=%d\n", width, height);
}