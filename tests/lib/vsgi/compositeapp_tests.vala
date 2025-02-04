/* tests/lib/vsgi/compositeapp_tests.vala
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
public abstract class CompositeAppTests : AppTests {

    protected CompositeAppTests(string name) {
        base(name);
    }

    protected VSGI.CompositeApp test_compositeapp;

    public override void test_valid_response() {
        test_app = test_compositeapp.of(new VSGI.NoContent());
        base.test_valid_response();
        test_app = null;
    }

    public override void tear_down() {
        test_compositeapp = null;
        base.tear_down();
    }

}
