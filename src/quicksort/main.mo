import Array "mo:base/Array";
import Int "mo:base/Int";

// https://github.com/dfinity/examples/blob/master/motoko/quicksort/src/Quicksort.mo

// https://github.com/dfinity/motoko-base/blob/doc-pages/modules/base-libraries/pages/Array.adoc

// https://smartcontracts.org/docs/candid-guide/candid-types.html
actor {

    private func quicksort(
            xs : [var Int],
            l : Int,
            r : Int
        ) {
            if (l < r) {
                var i = l;
                var j = r;
                var swap  = xs[0];
                let pivot = xs[Int.abs(l + r) / 2];
                while (i <= j) {
                    while (xs[Int.abs(i)] < pivot) {
                        i += 1;
                    };
                    while (xs[Int.abs(j)] > pivot) {
                        j -= 1;
                    };
                    if (i <= j) {
                    swap := xs[Int.abs(i)];
                    xs[Int.abs(i)] := xs[Int.abs(j)];
                    xs[Int.abs(j)] := swap;
                    i += 1;
                    j -= 1;
                    };
                };
                if (l < j) {
                    quicksort(xs, l, j);
                };

                if (i < r) {
                    quicksort(xs, i, r);
                };
            };
    };


    public func main(xs : [Int]) : async [Int] {
        let n = xs.size();

        if (n < 2) {
            return xs;
        } else {
            let result:[var Int] = Array.thaw(xs);
            quicksort(result, 0, n - 1);
            return Array.freeze(result);
        };
    };

};
