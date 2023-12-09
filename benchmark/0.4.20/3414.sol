contract Fail {
    struct MedicineBoxDefinition {
        uint medicineId;
        uint useBeforeDate;
    }

   function issue(MedicineBoxDefinition[]) {}
}