#############################################################################
##
##  Algebras.gd                                               Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for algebras.
##
#############################################################################

#! @Chapter Algebras

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The coefficients ring over which &homalg; can define a polynomial ring.
#! @Arguments A
#! @Returns a group algebra
#! @Label for IsAlgebra
DeclareAttribute( "CoefficientsRingForPolynomialAlgebra",
        IsAlgebra );

#! @Description
#!  Computes the list of powers <M>rad^i</M> of the radical <M>rad</M> of <A>A</A>,
#!  starting with the algebra <A>A</A>, regarded as the <M>0</M>-th power.
#! @Arguments A
#! @Returns a record
#! @Label for IsAlgebra
DeclareAttribute( "RadicalOfAlgebraPowers",
        IsAlgebra );
#! @InsertSystem RadicalOfAlgebraPowers

#! @Description
#!  Computes the list of powers <M>rad^i</M> of the radical <M>rad</M> of the subalgebra <A>A</A>
#!  of some algebra <M>B</M> as the intersection of the powers of radical of <M>B</M> with <A>A</A>
#!  (see <Ref Attr="RadicalOfAlgebraPowers" Label="for IsAlgebra"/>).
#! @Arguments A
#! @Returns a record
#! @Label for IsAlgebra
DeclareAttribute( "RadicalOfAlgebraPowersAsIntersection",
        IsAlgebra );

#! @Description
#!  Computes the list of powers <M>I^i</M> of the augmentation ideal <M>I</M> of the group algebra <A>kG</A>
#!  starting with the algebra <A>A</A>, regarded as the <M>0</M>-th power.
#! @Arguments kG
#! @Returns a record
#! @Label for IsAlgebraWithOne
DeclareAttribute( "AugmentationIdealPowers",
        IsAlgebraWithOne );
#! @InsertSystem AugmentationIdealPowers

#! @Description
#!  Computes <M>I^i</M> such that <M>I^{{i+1}} = I^i</M>
#!  where <M>I</M> is the augmentation ideal of the group algebra <A>kG</A>
#!  (see <Ref Attr="AugmentationIdealPowers" Label="for IsAlgebraWithOne"/>).
#! @Arguments kG
#! @Returns a two-sided ideal
#! @Label for IsAlgebraWithOne
DeclareAttribute( "HighestPowerOfAugmentationIdeal",
        IsAlgebraWithOne );
#! @InsertSystem HighestPowerOfAugmentationIdeal

#! @Description
#!  Computes the list of central primitive idempotents of the <E>involutive</E> algebra <A>A</A>.
#! @Arguments A
#! @Returns a list
#! @Label for IsAlgebraWithOne
DeclareAttribute( "CentralIdempotentsOfInvolutiveAlgebra",
        IsAlgebraWithOne );
#! @InsertSystem CentralIdempotentsOfInvolutiveAlgebra

#! @Description
#!  Computes the underlying module of the (not necessarily unitial) <A>k</A>-algbra <A>J</A>
#!  (with <C>CoefficientsRingForPolynomialAlgebra</C>( <A>A</A> ) set to <A>k</A>) over the polynomial <A>k</A>-algebra
#!  in as many indeterminates as <M>\dim</M><A>A</A>.
#! @Arguments J
#! @Returns a &homalg; module
#! @Group UnderlyingModule
DeclareAttribute( "UnderlyingModule",
        IsAlgebra );

####################################
#
#! @Section Operations
#
####################################

#! @Arguments k, J
#! @Group UnderlyingModule
DeclareOperation( "UnderlyingModule",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, L
DeclareOperation( "InducedFiltration",
        [ IsRing, IsList ] );

#! @Arguments k, r
DeclareOperation( "InducedFiltration",
        [ IsRing, IsRecord ] );