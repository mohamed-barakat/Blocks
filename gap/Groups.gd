#############################################################################
##
##  Groups.gd                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for groups.
##
#############################################################################

####################################
#
# properties:
#
####################################

DeclarePropertyWithDocumentation( "IsReal",
        CategoryCollections(IsMultiplicativeElementWithInverse),
        [ "Checks whether the conjugacy class <A>K</A> is real or not,",
          "i.e, if <A>K</A><M>=</M><C>Involution</C><M>(</M><A>K</A><M>)</M>",
          "(&see; <Ref Oper=\"Involution\" Label=\"for CategoryCollections(IsMultiplicativeElementWithInverse)\"/>).",
          "<#Include Label=\"IsReal:cc\">" ],
        "K",
        [ "Groups", "Property" ]
        );

####################################
#
# attributes:
#
####################################

DeclareAttributeWithDocumentation( "SerreCharacteristicSubgroup",
        IsGroup,
        [ "Computes the characteristic subgroup of <A>G</A>",
          "generated by the involutions and the squares.",
          "<#Include Label=\"SerreCharacteristicSubgroup\">" ],
        "a subgroup of <A>G</A>",
        "G",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "SerreFactorGroup",
        IsGroup,
        [ "Computes the factor group modulo of <A>G</A>",
          "<C>SerreCharacteristicSubgroup</C><M>(</M><A>G</A><M>)</M>",
          "(&see; <Ref Attr=\"SerreCharacteristicSubgroup\" Label=\"for IsGroup\"/>).",
          "<#Include Label=\"SerreFactorGroup\">" ],
        "a factor group of <A>G</A>",
        "G",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "NumberOfQuadraticEquationsOfUnitaryGroup",
        IsGroup,
        [ "Computes the number of quadratic equations",
          "defining the unitary group of the group ring of <A>G</A>",
          "in characteristic <M>2</M>.",
          "<#Include Label=\"NumberOfQuadraticEquationsOfUnitaryGroup\">" ],
        "a nonnegative integer",
        "G",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "DimensionOfUnitaryGroup",
        IsGroup,
        [ "Computes the dimension of the unitary group",
          "of the group ring of <A>G</A> in characteristic <M>2</M>.",
          "<#Include Label=\"DimensionOfUnitaryGroup\">" ],
        "a nonnegative integer",
        "G",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "ConjugacyClassesOfNormalSubgroup",
        IsGroup,
        [ "Computes the list of conjugacy classes of the group <M>G</M>",
          "which lie in the normal subgroup <A>N</A> <M>\\leq G</M>.",
          "<#Include Label=\"ConjugacyClassesOfNormalSubgroup\">" ],
        "a list of conjugacy classes of <M>G</M>",
        "N",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "ConjugacyClassesOfComplementOfNormalSubgroup",
        IsGroup,
        [ "Computes the list of conjugacy classes of the group <M>G</M>",
          "which do <E>not</E> lie in the normal subgroup <A>N</A> <M>\\leq G</M>." ],
        "a list of conjugacy classes of <M>G</M>",
        "N",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

DeclareAttributeWithDocumentation( "ConjugacyInvolutoryClassesOfComplementOfNormalSubgroup",
        IsGroup,
        [ "Computes a list of sets of conjugacy classes",
          "and their inverse classes of the group <M>G</M>",
          "which do <E>not</E> lie in the normal subgroup <A>N</A> <M>\\leq G</M>." ],
        "a list of conjugacy classes of <M>G</M>",
        "N",
        [ "Groups", "Attributes" ],
        rec( function_label := "for IsGroup" )
        );

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperationWithDocumentation( "IsRegular",
        [ IsMultiplicativeElementWithInverse, IsInt ],
        [ "Checks if the group element <A>g</A> is <A>p</A>-regular",
          "<#Include Label=\"IsRegular_code\">",
          "<#Include Label=\"IsRegular\">" ],
        "<C>true</C> or <C>false</C>",
        "g, p",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "IsRegular",
        [ CategoryCollections(IsMultiplicativeElementWithInverse), IsInt ],
        [ "Checks whether a representative <M>g=</M><C>Representative</C><M>(</M><A>K</A><M>)</M>",
          "of the conjugacy class <A>K</A><M>=g^G</M> is <A>p</A>-regular",
          "(&see; <Ref Prop=\"IsRegular\" Label=\"for IsMultiplicativeElementWithInverse, IsInt\"/>)." ],
        "<C>true</C> or <C>false</C>",
        "K, p",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "DefectGroup",
        [ CategoryCollections(IsMultiplicativeElementWithInverse), IsInt ],
        [ "Computes the defect <A>p</A>-group of a representative",
          "<M>g=</M><C>Representative</C><M>(</M><A>K</A><M>)</M>",
          "of the conjugacy class <A>K</A><M>=g^G</M> as a subgroup of",
          "<M>G=</M><C>ActingDomain</C><M>(</M><A>K</A><M>)</M>.",
          "<#Include Label=\"DefectGroup_code:cc\">",
          "<#Include Label=\"DefectGroup:cc\">" ],
        "a subgroup of <M>G</M>",
        "K, p",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "Involution",
        [ CategoryCollections(IsMultiplicativeElementWithInverse) ],
        [ "Computes the conjugacy class of <M>g^{-1}</M>",
          "where <M>g=</M><C>Representative</C><M>(</M><A>K</A><M>)</M>",
          "is a representative of the conjugacy class <A>K</A><M>=g^G</M>",
          "(&see; <Ref Prop=\"IsReal\" Label=\"for CategoryCollections(IsMultiplicativeElementWithInverse)\"/>)." ],
        "a conjugacy class in <M>G</M>",
        "K",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "Coefficient",
        [ IsElementOfFreeMagmaRing, IsMultiplicativeElementWithInverse ],
        [ "Computes the coefficient of the group element <A>g</A>",
          "in the group ring element <A>b</A>.",
          "<#Include Label=\"Coefficient\">" ],
        "a ring element",
        "b, g",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "Coefficient",
        [ IsElementOfFreeMagmaRing, CategoryCollections(IsMultiplicativeElementWithInverse) ],
        [ "Computes the coefficient of the conjugacy class <A>K</A>",
          "in the group ring element <A>b</A>, where <A>b</A> his assumed to be central",
          "(&see; <Ref Prop=\"Coefficient\" Label=\"for IsElementOfFreeMagmaRing, IsMultiplicativeElementWithInverse\"/>)." ],
        "a ring element",
        "b, K",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "Coefficients",
        [ IsElementOfFreeMagmaRing ],
        [ "Computes the coefficients of all conjugacy classes",
          "in the group ring element <A>b</A>, where <A>b</A> his assumed to be central",
          "(&see; <Ref Prop=\"Coefficient\" Label=\"for IsElementOfFreeMagmaRing, CategoryCollections(IsMultiplicativeElementWithInverse)\"/>)." ],
        "a list",
        "b",
        [ "Groups", "Operations" ]
        );

DeclareOperationWithDocumentation( "ConjugacyInvolutoryClassesOfComplementOfNormalSubgroup",
        [ IsAlgebra, IsGroup ],
        [ "Computes a list of <A>kG</A>-sums of conjugacy classes",
          "and their inverse classes of the group <M>G</M>",
          "which do <E>not</E> lie in the normal subgroup <A>N</A> <M>\\leq G</M>." ],
        "a list of conjugacy classes of <M>G</M>",
        "kG,N",
        [ "Groups", "Operations" ],
        rec( function_label := "for IsAlgebra, IsGroup" )
        );