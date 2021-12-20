#include <stdio.h>
#include <SDL.h>
#include <SDL_image.h>
#include <SDL_mixer.h>

void sdl_version()
{
  SDL_version compiled;
  SDL_version linked;
  SDL_VERSION(&compiled);
  SDL_GetVersion(&linked);
  printf("compiled with SDL2 version: %d.%d.%d\n",
       compiled.major, compiled.minor, compiled.patch);
  printf("running with SDL2 version:  %d.%d.%d.\n",
       linked.major, linked.minor, linked.patch);
}

void sdl_image_version()
{
  SDL_version compile_version;
  const SDL_version *link_version=IMG_Linked_Version();
  SDL_IMAGE_VERSION(&compile_version);
  printf("compiled with SDL_image version: %d.%d.%d\n",
          compile_version.major,
          compile_version.minor,
          compile_version.patch);
  printf("running with SDL_image version: %d.%d.%d\n",
          link_version->major,
          link_version->minor,
          link_version->patch);
}

void sdl_mixer_version()
{
  SDL_version compile_version;
  const SDL_version *link_version=Mix_Linked_Version();
  SDL_MIXER_VERSION(&compile_version);
  printf("compiled with SDL_mixer version: %d.%d.%d\n",
          compile_version.major,
          compile_version.minor,
          compile_version.patch);
  printf("running with SDL_mixer version: %d.%d.%d\n",
          link_version->major,
          link_version->minor,
          link_version->patch);
}

int main(int argc,char** argv)
{
  sdl_version();
  sdl_image_version();
  sdl_mixer_version();

  if(SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) < 0){
    printf("SDL_Init: %s\n", SDL_GetError());
    return 0;
  }

  int flags=IMG_INIT_PNG;
  int initted=IMG_Init(flags);
  if((initted&flags) != flags) {
    printf("IMG_Init: %s\n", IMG_GetError());
    return 0;
  }

  SDL_Surface *image=IMG_Load("sample.png");
  if(!image) {
    printf("IMG_Load: %s\n", IMG_GetError());
    return 0;
  }

  flags = MIX_INIT_MP3;
  initted=Mix_Init(flags);
  if((initted&flags) != flags) {
    printf("Mix_Init: %s\n", Mix_GetError());
    return 0;
  }

  if(Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 4096) == -1){
    printf("Mix_OpenAudio: %s\n", SDL_GetError());
    return 0;
  }

  Mix_Music *music = Mix_LoadMUS("sample.mp3");
  if(!music) {
    printf("Mix_LoadMUS: %s\n", Mix_GetError());
    return 0;
  }
  Mix_PlayMusic(music,-1);

  SDL_Window *window = SDL_CreateWindow("done.",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,320,240,0);
  SDL_Surface* screen = SDL_GetWindowSurface(window);
  SDL_BlitSurface(image,NULL,screen,NULL);
  SDL_UpdateWindowSurface(window);

  SDL_Event e;
  for (;;) {
    SDL_PollEvent(&e);
    if (e.type == SDL_QUIT) {
      break;
    }
    SDL_Delay(20);
  }

  return 0;
}
