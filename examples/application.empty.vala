/* examples/application.empty.vala
 *
 * Copyright (C) 2021 Lenny Andreu S.
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
 *      Lenny Andreu S. <landreuhs.29@gmail.com>
 *      Jeffrey T. Peckham <abic@ophymx.com>
 */
 namespace VSGI {

    /**
     *
     */
    public class Empty : Object, Application {
    
        /**
         *
         */
        public Empty() {
        }
    
        /**
         * {@inheritDoc}
         */
        public Response call(Request request) {
            return empty_html_call(request);
        }
    
        /**
         *
         */
        public static Response empty_html_call(Request request) {
            var headers = new Gee.HashMap<string, string>();
            var body = new Gee.ArrayList<Bytes>();
            var r = request;
            var builder = new StringBuilder();
            var ci = r.connection_info;
            builder.append_printf("<!DOCTYPE html>
            <head>
                <title>Vala example server</title>
            </head>
            <body>
                <h1>Vala example server</h1>
                <p>Hello world to %s from %s</p>
            </body>\r\n",
                ci.remote.to_string(),
                ci.local_url()
            );

            body.add(new Bytes(builder.data));
    
            var length = request.content_length();
            if (length > 0) {
                foreach (var chunk in request.body) {
                    body.add(chunk);
                    length -= (ssize_t) chunk.get_size();
                    if (length <= 0)
                        break;
                }
            }
            length = 0;
            foreach (var chunk in body) {
                length += (ssize_t) chunk.get_size();
            }
            headers["Content-Length"] = length.to_string();
            headers["Content-Type"] = "text/html";
    
            return new Response(200, headers, new IterableBytesBody(body));
        }
    }
    
    }
    