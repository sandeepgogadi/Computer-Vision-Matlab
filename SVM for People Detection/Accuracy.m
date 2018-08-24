function acc = Accuracy(pred, labels)
    acc = sum(labels == pred)/numel(labels);
end
