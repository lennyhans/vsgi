project('com.github.ophymx.vsgi', 'vala', 'c', version: '0.0.1')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')],
                      language: 'vala')

api_version = '1.0'

inc = include_directories('.')

posix = meson.get_compiler('vala').find_library('posix')

libvsgi = static_library(
  'vsgi-'+api_version,
  'src/lib/vsgi/apps/cascade.vala',
  'src/lib/vsgi/apps/chunked.vala',
  'src/lib/vsgi/apps/common_logger.vala',
  'src/lib/vsgi/apps/composite_stack.vala',
  'src/lib/vsgi/apps/echo.vala',
  'src/lib/vsgi/apps/file_server.vala',
  'src/lib/vsgi/apps/lint.vala',
  'src/lib/vsgi/apps/mapper.vala',
  'src/lib/vsgi/apps/nocontent.vala',
  'src/lib/vsgi/apps/notfound.vala',
  'src/lib/vsgi/apps/suffix_mapper.vala',
  'src/lib/vsgi/utils/body.vala' ,
  'src/lib/vsgi/utils/chunked_body.vala' ,
  'src/lib/vsgi/utils/headers.vala' ,
  'src/lib/vsgi/utils/input_stream_body.vala' ,
  'src/lib/vsgi/utils/iterable_bytes.vala' ,
  'src/lib/vsgi/utils/methods.vala' ,
  'src/lib/vsgi/utils/protocols.vala' ,
  'src/lib/vsgi/utils/scheme.vala',
  'src/lib/vsgi/utils/simple_body.vala' ,
  'src/lib/vsgi/utils/status.vala',
  'src/lib/vsgi/application.vala' ,
  'src/lib/vsgi/compositeapp.vala' ,
  'src/lib/vsgi/connection_info.vala' ,
  'src/lib/vsgi/lib.vala' ,
  'src/lib/vsgi/request.vala' ,
  'src/lib/vsgi/response.vala',
  dependencies: [
    # dependency('libgda-5.0'),
    dependency('glib-2.0'),
    dependency('gmodule-2.0'),
    dependency('gee-0.8'),
    dependency('gio-2.0')
    # dependency('libxml-2.0')
  ],
  include_directories: inc,
  install: true
)

libvsgi_dep = declare_dependency(
  include_directories: inc,
  link_with: libvsgi
)

libvsgi_server = shared_library(
  'vsgi-server-'+api_version,
  'src/lib/vsgi-server/server.vala',
  'src/lib/vsgi-server/server_main.vala',
  dependencies: [
    dependency('glib-2.0'),
    dependency('gmodule-2.0'),
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    libvsgi_dep
  ],
  include_directories: inc,
  install: true
)

libvsgi_server_dep = declare_dependency(
  include_directories: inc,
  link_with: libvsgi_server
)

libvsgi_server_simple = shared_library(
  'vsgi-server-simple-'+api_version,
  'src/lib/vsgi-server-simple/simple.vala',
  # 'src/lib/vsgi/simple.vala',
  # 'src/lib/vsgi-server-simple/simple.vala',
  dependencies: [
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    posix,
    libvsgi_dep,
    libvsgi_server_dep
  ],
  build_rpath: meson.current_build_dir(),
  include_directories: inc,
  install: true
)

libvsgi_server_simple_dep = declare_dependency(
  include_directories: inc,
  link_with: libvsgi_server_simple
)


libvsgi_server_fcgi = shared_library(
  'vsgi-server-fcgi-'+api_version,
  'src/lib/vsgi-server-fcgi/fcgi-server.vala',
  dependencies: [
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    libvsgi_dep,
    libvsgi_server_dep,
    dependency('fcgi'),
  ],
  include_directories: inc,
  install: true
)

libvsgi_server_fcgi_dep = declare_dependency(
  include_directories: inc,
  link_with: libvsgi_server_fcgi
)

subdir('tests')
subdir('examples')