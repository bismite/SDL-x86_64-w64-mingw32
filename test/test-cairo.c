#include <stdio.h>
#include <cairo.h>
#include <cairo-ft.h>
#include <ft2build.h>
#include FT_FREETYPE_H

#define FONTNAME "gohufont-14.bdf"

int test_cairo(FT_Library freetype)
{
  FT_Face face;
  FT_New_Face(freetype, FONTNAME, 0, &face);
  cairo_surface_t *surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32,64,64);
  cairo_t *c = cairo_create(surface);
  cairo_font_face_t *font = cairo_ft_font_face_create_for_ft_face(face,0);
  cairo_set_font_face(c,font);
  cairo_set_font_size(c,14);
  cairo_set_source_rgb(c,0,0,0);
  cairo_move_to(c,4,32);
  cairo_show_text(c, "ABC123");
  cairo_surface_write_to_png(surface, "test-cairo.png");
  return 0;
}

int main(int argc,char** argv)
{
  printf("cairo %s\n",cairo_version_string());
  FT_Library freetype;
  FT_Init_FreeType(&freetype);
  int major,minor,patch;
  FT_Library_Version(freetype,&major,&minor,&patch );
  printf("freetype %d.%d.%d\n",major,minor,patch);
  return test_cairo(freetype);
}
