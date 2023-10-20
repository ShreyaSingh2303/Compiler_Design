%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%option noyywrap

%%
"rectangle" {
    double length, width;
    printf("Enter length and width of the rectangle: ");
    scanf("%lf %lf", &length, &width);
    printf("Area of rectangle: %.2lf\n", length * width);
}

"triangle" {
    double base, height;
    printf("Enter base and height of the triangle: ");
    scanf("%lf %lf", &base, &height);
    printf("Area of triangle: %.2lf\n", 0.5 * base * height);
}

"circle" {
    double radius;
    printf("Enter the radius of the circle: ");
    scanf("%lf", &radius);
    printf("Area of circle: %.2lf\n", M_PI * radius * radius);
}

. {
    printf("Unrecognized shape\n");
}

%%

int main() {
    while (1) {
        printf("Enter a shape (rectangle, triangle, circle, or 'exit' to quit): ");
        yylex();
    }
    return 0;
}
