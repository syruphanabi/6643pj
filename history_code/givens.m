function [c,s] = givens(a,b)
    format long
    if abs(b) > abs(a)
        if b == 0
            c = 1; s = 0; return;
        end
        r = -a/b; s = 1/sqrt(1+r*r);c = s*r;
    else
        r = -b/a; c = 1/sqrt(1+r*r);s = c*r;
    end

end
