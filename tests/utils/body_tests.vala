
public class BodyTests : Gee.TestCase {

    public BodyTests() {
        base("Body");
        add_test("[Body] ", func);
    }

    protected VSGI.Body test_body;

    public override void set_up() {
        test_body = new VSGI.Body.from_string("foobar");
    }

    public override void tear_down() {
        test_body = null;
    }

    public virtual void func() {
    }


}
