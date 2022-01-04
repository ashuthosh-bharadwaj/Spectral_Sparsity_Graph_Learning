function Y = sparser(Mat,k);
    Y = zeros(size(Mat));

    for i = 1:M
        [B,I]= maxk(Mat(:,i),k,'ComparisonMethod','abs');
        Y(:,I) = Mat(:,I);
    end

end