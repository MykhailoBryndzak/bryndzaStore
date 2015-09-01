package com.springapp.anotation;


import java.lang.annotation.*;

@Target(ElementType.PARAMETER)//ежі застосування(в параметрі метода)
@Retention(RetentionPolicy.RUNTIME)//час існування
@Documented//попадає в javadoc
public @interface ActiveUser {
}
