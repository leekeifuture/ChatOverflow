package com.company.unit;

import org.hamcrest.Matchers;
import org.junit.Assert;
import org.junit.Test;

public class DumpPasswordEncoderTest {

    @Test
    public void encode() {
        DumpPasswordEncoder encoder = new DumpPasswordEncoder();

        String st = "mypswd";

        Assert.assertEquals(String.format("secret: '%s'", st),
                encoder.encode(st));
        Assert.assertThat(encoder.encode(st), Matchers.containsString(st));
    }
}
