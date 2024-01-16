namespace CatBox {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    
    operation SetQubitState(desired : Result, target : Qubit) : Unit {
        if desired != M(target) {
            X(target);
        }
    }

    @EntryPoint()
    operation CatBox() : Unit {
        Message("Preparing radioctive atom");
        use radioactiveAtom = Qubit();
        H(radioactiveAtom);
        // Y(radioactiveAtom);

        Message("Radioactive atom after applying H:");
        DumpMachine();

        use cat = Qubit();
        SetQubitState(One, cat); // the cat is alive

        CNOT(radioactiveAtom, cat); // entangle the life of the cat with the radioactive atom
        Message("Radioactive atom and cat after entangle them:");
        DumpMachine();


        let isFired = M(radioactiveAtom);  // measure the atom
        let isCatAlive = M(cat);

        Message("Radioactive atom and cat after the measurement:");
        DumpMachine();

        Reset(radioactiveAtom);
        Reset(cat);
    }
}
