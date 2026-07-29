import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure ExponentialFuzzyFamilyPackage where
  baseMeasure : Type u
  naturalParameter : Type v
  sufficientStatistic : Type w
  fuzzyLogPartition : Prop
  exponentialForm : Prop
  regularityConditions : Prop
  fuzzyLogPartitionEvidence : fuzzyLogPartition
  exponentialFormEvidence : exponentialForm
  regularityEvidence : regularityConditions

structure ExponentialFuzzyFamilyEvidence (E : ExponentialFuzzyFamilyPackage) where
  fuzzyLogPartitionClosed : E.fuzzyLogPartition
  exponentialFormClosed : E.exponentialForm
  regularityClosed : E.regularityConditions

def ExponentialFuzzyFamilyClosed (E : ExponentialFuzzyFamilyPackage) : Prop :=
  E.fuzzyLogPartition ∧ E.exponentialForm ∧ E.regularityConditions

theorem exponential_fuzzy_family_closed_from_evidence
    (E : ExponentialFuzzyFamilyPackage) (Ev : ExponentialFuzzyFamilyEvidence E) :
    ExponentialFuzzyFamilyClosed E := by
  exact And.intro Ev.fuzzyLogPartitionClosed
    (And.intro Ev.exponentialFormClosed Ev.regularityClosed)

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse