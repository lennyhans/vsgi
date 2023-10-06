using VSGI;

public static int main(string[] args) {
    var echoApp = new Gee.HashMap<string, VSGI.Application>();
    echoApp.set("/echo",new Echo());
    //  echoApp.Add
    var mapper = new Mapper.Composite(echoApp);
    var apps = new Gee.ArrayList<CompositeApp>.wrap({ new CommonLogger.Composite(), mapper });
    var stack = new CompositeStack(apps);
    var server = new SimpleServer(stack.of(new Empty()), 8080);

    return Server.run(server);
}
