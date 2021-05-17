//
//  test.java
//  test
//
//  Created by Christian Schmitz on Sun Dec 05 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//
import java.util.*;

public class test {
    
    // This is for Test1 to Test3
    static int n;

    public static void main (String args[]) {
        // insert code here...
       System.out.println(args.length+" entries in array.");
       System.out.println("Hello World"+ (args.length>0?args[0]:"!"));
       n++;
    }
    
    // This is for Test4:
    int value;
    
    public test() // constructor
    {
        value=1000;
    }
    
    public void setValue(int newValue)
    {
        value=newValue;
    }
    
    public int getValue()
    {
        return value;
    }
    
    public void increment()
    {
        value++;
    }
    
    // this is for Test5:
    
    public static String GetString()
    {
        String s="Hello from Java! \u00E4\u00F6\u00FC"; // ae oe ue
        System.out.println(s);
        return s;
    }

    // this is for Test6:
    
    public static String[] GetStringArray()
    {
        String a[]=new String[3];
        a[0]="Hello";
        a[1]="from";
        a[2]="Java";
        return a;
    }
}
