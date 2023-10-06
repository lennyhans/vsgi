## TESTS
libvsgi_tests = executable(
  'vsgi-tests',
  'helpers/testcase.vala',
  'lib/vsgi/apps/cascade_tests.vala',
  'lib/vsgi/apps/chunked_tests.vala',
  'lib/vsgi/apps/common_logger_tests.vala',
  'lib/vsgi/apps/composite_stack_tests.vala',
  'lib/vsgi/apps/echo_tests.vala',
  'lib/vsgi/apps/file_server_tests.vala',
  'lib/vsgi/apps/lint_tests.vala',
  'lib/vsgi/apps/mapper_tests.vala',
  'lib/vsgi/apps/nocontent_tests.vala',
  'lib/vsgi/apps/notfound_tests.vala',
  'lib/vsgi/apps/suffix_mapper_tests.vala',
  'lib/vsgi/utils/body_tests.vala',
  'lib/vsgi/utils/iterable_byte_stream_tests.vala',
  'lib/vsgi/utils/iterable_chunked_bytes_tests.vala',
  'lib/vsgi/utils/methods_tests.vala',
  'lib/vsgi/utils/protocols_tests.vala',
  'lib/vsgi/utils/scheme_tests.vala',
  'lib/vsgi/utils/status_tests.vala',
  'lib/vsgi/app_tests.vala',
  'lib/vsgi/compositeapp_tests.vala',
  'lib/vsgi/helpers.vala',
  'lib/vsgi/request_tests.vala',
  'lib/vsgi/response_tests.vala',
  'lib/vsgi/testmain.vala',
  # 'server_tests.vala',
  # 'servers/simple_tests.vala',
  dependencies: [
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    libvsgi_dep,
    # libvsgi_server_dep,
    # libvsgi_server_simple_dep
  ]
)

libvsgi_server_simple_tests = executable(
  'vsgi-server-simple-tests',
  'helpers/testcase.vala',
  'server_tests.vala',
  'servers/simple_tests.vala',
  'servers/fcgi_tests.vala',
  'servers/testmain.vala',
  dependencies: [
    dependency('gee-0.8'),
    dependency('gio-2.0'),
    libvsgi_dep,
    libvsgi_server_dep,
    libvsgi_server_simple_dep,
    libvsgi_server_fcgi_dep
  ]
)

test('libvsgi_tests', libvsgi_tests, args: [])
test('libvsgi_server_simple_tests', libvsgi_server_simple_tests, args: [])