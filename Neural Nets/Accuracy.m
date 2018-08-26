function acc = Accuracy(pred, labels)

    [~, labels] = max(labels, [], 2);
    acc = sum(labels == pred)/numel(labels);
end
