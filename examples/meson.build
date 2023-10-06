# inc = include_directories('.')

vsgi_example = executable(
  'vsgi-example',
  'example_app.vala',
  'application.empty.vala',
  dependencies: [
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    libvsgi_dep,
    libvsgi_server_dep,
    libvsgi_server_simple_dep
  ]
)