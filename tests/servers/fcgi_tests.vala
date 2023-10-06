/* tests/servers/fcgi_tests.vala
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
public class FcgiServerTests : ServerTests {

    public FcgiServerTests() {
        base("FcgiServer");
    }

    public override void set_up() {
        VSGI.Application app = new VSGI.Echo();
        test_server = new VSGI.FcgiServer(app, "./fastcgi/mysocket", 5000);
    }

    public override void tear_down() {
        test_server = null;
    }

}
