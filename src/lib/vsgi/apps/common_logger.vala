/* lib/vsgi/apps/common_logger.vala
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
namespace VSGI {

/**
 * A composite app that generates log entries per request
 * that conform to the Common Log Format generated by Apache and Nginx
 */
public class CommonLogger : Object, Application, CompositeApp {

    private const string FORMAT = "%s - %s [%s] \"%s %s %s\" %u %s";
    private const string TIME_FORMAT = "%d/%b/%Y:%H:%M:%S %z";

    public Application app { set; get; }

    public CommonLogger(Application? app=null) {
        this.app = app;
    }

    /**
     * {@inheritDoc}
     */
    public Response call(Request request) {
        assert(this.app != null);

        Response response = app.call(request);

        response.body_sent.connect(() => {
            Time now = Time.local((time_t) new DateTime.now_utc().to_unix());

            log("VSGI.CommonLogger", LogLevelFlags.LEVEL_INFO, FORMAT,
                request.remote_addr,
                request.remote_user.length != 0 ?  request.remote_user : "-",
                now.format(TIME_FORMAT),
                request.method.to_string(),
                request.full_path(),
                request.protocol.to_string(),
                response.status.code,
                response.content_length() <= 0 ? "-" :
                    response.content_length().to_string());
        });

        return response;
    }
}

}
