/* tests/lib/vsgi/testmain.vala
 *
 * Copyright (C) 2012 Jeffrey T. Peckham
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 *      Jeffrey T. Peckham <abic@ophymx.com>
 */

const string ASSETS_DIR = "../tests/assets";

int main (string[] args) {
    Test.init(ref args);
    TestSuite tests = TestSuite.get_root();

    /* Server */
    TestSuite server_tests = new TestSuite("Servers");
    server_tests.add_suite(new SimpleServerTests().get_suite());
    server_tests.add_suite(new FcgiServerTests().get_suite());
    tests.add_suite(server_tests);

    return Test.run();
}
