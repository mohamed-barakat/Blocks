#############################################################################
##
##  Blocks.gi                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for blocks.
##
#############################################################################

####################################
#
# methods for properties:
#
####################################

##
InstallMethod( IsBlock,
        [ IsAlgebra and HasOne ],
        
  function( B )
    local b;
    
    b := One( B );
    
    if IsBound( b![999] ) then
        ## if block then real;
        ## see CentralIdempotentsOfInvolutiveAlgebra
        if b![999] = true then
            SetIsReal( B, true );
        fi;
        return b![999];
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( IsReal,
        [ IsAlgebra and HasOne and IsBlock ],
        
  function( B )
    local b;
    
    b := One( B );
    
    return b = Involution( b );
    
end );

##
InstallMethod( IsReal,
        [ IsAlgebra and HasAssociatedTableBlock ],
        
  function( B )
    local b;
    
    b := AssociatedTableBlock( B );
    
    if IsList( b ) then
        if Length( b ) > 1 then
            return false;
        fi;
        b := b[1];
    fi;
    
    return IsReal( b );
    
end );

##
InstallMethod( IsPrincipal,
        [ IsAlgebra and HasAssociatedTableBlock ],
        
  function( B )
    local b;
    
    b := AssociatedTableBlock( B );
    
    if IsList( b ) then
        if Length( b ) > 1 then
            return false;
        fi;
        b := b[1];
    fi;
    
    return IsPrincipal( b );
    
end );

##
InstallMethod( IsSpecial,
        [ IsAlgebra and HasAssociatedTableBlock ],
        
  function( B )
    local b;
    
    b := AssociatedTableBlock( B );
    
    if IsList( b ) then
        if Length( b ) > 1 then
            return false;
        fi;
        b := b[1];
    fi;
    
    return IsSpecial( b );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( GroupRingOverSpecialSplittingField,
        [ "IsGroup" ],
        
  function( G )
    local kG;
    
    kG := GroupRing( SpecialSplittingField( G ), G );
    
    SetIsDefinedOverSpecialSplittingField( kG, true );
    
    return kG;
    
end );

##
InstallMethod( Dimension,
        [ IsAlgebra and HasAssociatedTableBlock ],
        
  function( B )
    local b;
    
    b := AssociatedTableBlock( B );
    
    if IsList( b ) then
        return Sum( b, Dimension );
    fi;
    
    return Dimension( b );
    
end );

##
InstallMethod( BlockOfIdempotent,
        [ "IsElementOfFreeMagmaRing" ],
        
  function( e )
    local kG, B;
    
    if IsBound( e![1234] ) and IsAlgebra( e![1234] ) then
        return e![1234];
    fi;
    
    ## see CentralIdempotentsOfInvolutiveAlgebra
    if not ( IsBound( e![1001] ) and IsAlgebra( e![1001] ) ) then
        TryNextMethod( );
    fi;
    
    kG := e![1001];
    
    B := TwoSidedIdeal( kG, [ e ] );
    
    SetOne( B, e );
    
    if IsBound( e![999] ) then
        SetIsBlock( B, e![999] );
        ## if block then real;
            ## see CentralIdempotentsOfInvolutiveAlgebra
        if e![999] then
            SetIsReal( B, true );
        fi;
    fi;
    
    if HasCoefficientsRingForPolynomialAlgebra( kG ) then
        SetCoefficientsRingForPolynomialAlgebra( B,
                CoefficientsRingForPolynomialAlgebra( kG ) );
    fi;
    
    ## FIXME: undocumented, is there a way to add a `component' to IsMagmaRingObjDefaultRep
    e![1234] := B;
    
    return B;
    
end );

##
InstallMethod( PrincipalBlockIdempotent,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    
    return One( PrincipalBlock( kG ) );
    
end );

##
InstallMethod( CentralNonPrincipalIdempotentsOfGroupAlgebra,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    local e, pos;
    
    ## CentralIdempotentsOfAlgebra does not store kG in the e's
    e := CentralIdempotentsOfInvolutiveAlgebra( kG );
    
    e := ShallowCopy( e );
    
    pos := PositionProperty( e, b -> IsOne( Sum( CoefficientsBySupport( b ) ) ) );
    
    Remove( e, pos );
    
    return e;
    
end );

##
InstallMethod( BlocksOfGroupAlgebra,
        [ IsGroupAlgebra and IsDefinedOverSplittingField ],
        
  function( kG )
    local bs, Bs;
    
    bs := TableBlocks( kG );
    
    Bs := BlocksOfTableBlocks( bs, kG );
    
    Assert( 0, HasPrincipalBlock( kG ) );
    
    return Bs;
    
end );

##
InstallMethod( InvolutoryBlocksOfGroupAlgebra,
        [ IsGroupAlgebra and IsDefinedOverInvolutionSplittingField ],
        
  function( kG )
    local bs, orb, Bs, B0;
    
    bs := TableBlocks( kG );
    
    Assert( 0, List( bs, NumberOfBlock ) = [ 1 .. Length( bs ) ] );
    
    orb := Orbits( Group( PermList( List( List( bs, ComplexConjugate ), NumberOfBlock ) ) ), [ 1 .. Length( bs ) ] );
    
    bs := List( orb, L -> bs{L} );
    
    Bs := BlocksOfTableBlocks( bs, kG );
    
    Assert( 0, HasPrincipalBlock( kG ) );
    
    return Bs;
    
end );

##
InstallMethod( RealBlocksOfGroupAlgebra,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    local bs, Bs;
    
    bs := RealTableBlocks( kG );
    
    Bs := BlocksOfTableBlocks( bs, kG );
    
    Assert( 0, HasPrincipalBlock( kG ) );
    
    return Bs;
    
end );

##
InstallMethod( RealNonPrincipalBlocksOfGroupAlgebra,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    local bs, Bs;
    
    bs := RealNonPrincipalTableBlocks( kG );
    
    Bs := BlocksOfTableBlocks( bs, kG );
    
    Assert( 0, not ForAny( Bs, IsPrincipal ) );
    
    return Bs;
    
end );

##
InstallMethod( SpecialBlocks,
        [ IsGroupAlgebra ],
        
  function( kG )
    local bs, Bs;
    
    bs := SpecialTableBlocks( UnderlyingGroup( kG ) );
    
    Bs := BlocksOfTableBlocks( bs, kG );
    
    Assert( 0, ForAll( Bs, IsSpecial ) );
    
    return Bs;
    
end );

##
InstallMethod( SpecialBlocks,
        [ IsGroup ],
        
  function( G )
    
    return SpecialBlocks( GroupRingOverSpecialSplittingField( G ) );
    
end );

##
InstallMethod( PrincipalBlock,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    local b0, B0;
    
    b0 := First( TableBlocks( kG ), IsPrincipal );
    
    Assert( 0, IsBlockOfCharacterTable( b0 ) );
    
    B0 := BlocksOfTableBlocks( [ b0 ], kG )[1];
    
    Assert( 0, IsPrincipal( B0 ) );
    Assert( 0, IsReal( B0 ) );
    
    if Characteristic( kG ) = 2 then
        Assert( 0, not IsSpecial( B0 ) );
    fi;
    
    return B0;
    
end );

##
InstallMethod( AssociatedProjectionMatrix,
        [ IsAlgebra and HasOne ],
        
  function( B )
    local kG, G, b, bas, proj, k, c, d;
    
    kG := UnderlyingGroupAlgebra( B );
    
    G := UnderlyingMagma( kG );
    
    b := One( B );
    
    bas := Basis( B );
    
    proj := List( G, g -> b * g );
    
    return List( proj, a -> Coefficients( bas, a ) );
    
end );

##
InstallMethod( AssociatedProjection,
        [ IsHomalgModule ],
        
  function( M )
    local G, b, proj, mat, R, k, kG;
    
    if not IsBound( M!.GroupAlgebra ) then
        TryNextMethod( );
    fi;
    
    G := Basis( M!.GroupAlgebra );
    
    b := M!.UnitOfAlgebraicGroup;
    
    b := AsElementOfAlgebra( b );
    
    proj := List( G, g -> b * g );
    
    mat := List( proj, a -> Coefficients( M, a ) );
    
    R := HomalgRing( M );
    
    mat := HomalgMatrix( mat, R );
    
    kG := UnderlyingGroupAlgebra( M!.UnderlyingAlgebra );
    
    kG := Dimension( kG ) * R;
    
    return HomalgMap( mat, kG, M );
    
end );

#! @Chunk AssociatedTableBlock_method
#!  The fallback method computes the central characters of all <M>p</M>-blocks
#!  and searches for the unique central character <M>\omega</M> with <M>\omega</M>(<A>b</A>)<M>=1</M>.
#!  For all other central characters <M>\omega</M>(<A>b</A>)<M>=0</M>.
#! @EndChunk
#
InstallMethod( AssociatedTableBlock,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local ordtbl, blocks, omegas, coeffs, prod, pos;
    
    ordtbl := OrdinaryCharacterTable( b );
    
    blocks := TableBlocks( ordtbl, Characteristic( b ) );
    
    omegas := List( blocks, CentralCharacter );
    
    coeffs := Coefficients( b );
    
    prod := List( omegas, omega -> omega * coeffs );
    
    ## omega( b ) = 1 if omega <-> b otherwise omega( b ) = 0
    pos := PositionProperty( prod, a -> not IsZero( a ) );
    
    ## otherwise b is not a block idempotent
    ## (e.g., it is the sum of the block idempotents of two conjugate complex blocks)
    Assert( 0, IsOne( prod[pos] ) );
    Assert( 0, PositionProperty( prod, a -> not IsZero( a ), pos + 1 ) = fail );
    
    return blocks[pos];
    
end );

##
InstallMethod( AssociatedTableBlock,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local B;
    
    B := BlockOfIdempotent( b );
    
    if not HasAssociatedTableBlock( B ) then
        TryNextMethod( );
    fi;
    
    return AssociatedTableBlock( B );
    
end );

##
InstallMethod( AssociatedTableBlock,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return AssociatedTableBlock( One( B ) );
    
end );

##
InstallMethod( Defect,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return Defect( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( Defect,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return Defect( One( B ) );
    
end );

##
InstallMethod( Irr,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return Irr( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( Irr,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return Irr( One( B ) );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return OrdinaryCharactersDegrees( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return OrdinaryCharactersDegrees( One( B ) );
    
end );

##
InstallMethod( FrobeniusSchurNumber,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return FrobeniusSchurNumber( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( FrobeniusSchurNumber,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return FrobeniusSchurNumber( One( B ) );
    
end );

##
InstallMethod( IBr,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return IBr( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( IBr,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return IBr( One( B ) );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return BrauerCharactersDegrees( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return BrauerCharactersDegrees( One( B ) );
    
end );

##
InstallMethod( DecompositionMatrix,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return DecompositionMatrix( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( DecompositionMatrix,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return DecompositionMatrix( One( B ) );
    
end );

##
InstallMethod( CartanMatrix,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return CartanMatrix( AssociatedTableBlock( b ) );
    
end );

##
InstallMethod( CartanMatrix,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return CartanMatrix( One( B ) );
    
end );

##
InstallMethod( DefectClasses,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local kG, classes, defclasses;
    
    kG := UnderlyingGroupAlgebra( b );
    
    classes := ConjugacyClasses( OrdinaryCharacterTable( kG ) );
    
    defclasses := ClassPositionsOfDefectClasses( AssociatedTableBlock( b ) );
    
    return classes{defclasses};
    
end );

##
InstallMethod( DefectClasses,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return DefectClasses( One( B ) );
    
end );

#! @Code DefectGroup_code
InstallMethod( DefectGroup,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    return DefectGroup(
                   DefectClasses( b )[1],
                   Characteristic( b ) );
    
end );
#! @EndCode

##
InstallMethod( DefectGroup,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return DefectGroup( One( B ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( GroupRingOverSplittingField,
        [ IsInt, IsGroup ],
        
  function( p, G )
    local kG;
    
    kG := GroupRing( SplittingField( G, p ), G );
    
    SetIsDefinedOverSplittingField( kG, true );
    
    return kG;
    
end );

##
InstallMethod( GroupRingOverInvolutionSplittingField,
        [ IsInt, IsGroup ],
        
  function( p, G )
    local kG;
    
    kG := GroupRing( InvolutionSplittingField( G, p ), G );
    
    SetIsDefinedOverInvolutionSplittingField( kG, true );
    
    return kG;
    
end );

## a technical operation to avoid code duplication
InstallMethod( BlocksOfTableBlocks,
        [ "IsList", "IsGroupAlgebra" ],
        
  function( bs, kG )
    local b, G, one, KK, Bs, n, B0;
    
    bs := List( bs,
                function( b )
                  if IsBlockOfCharacterTable( b ) then
                      return [ b ];
                  elif IsList( b ) and ForAll( b, IsBlockOfCharacterTable ) then
                      return b;
                  fi;
                  
                  Error( "the first argument must be a list (of lists) of table blocks\n" );
                  
              end );
    
    if bs = [ ] then
        return bs;
    fi;
    
    b := bs[1][1];
    
    G := UnderlyingGroup( UnderlyingCharacterTable( b ) );
    
    Assert( 0, IsIdenticalObj( G, UnderlyingGroup( kG ) ) );
    
    one := One( kG );
    
    KK := ConjugacyClasses( G ){b!.pregular};
    
    KK := List( KK, K -> Sum( List( K, g -> Coerce( one, g ) ) ) );
    
    Bs := List( bs, L -> Sum( L, b -> PCoefficientsOfOsimaIdempotent( b ) ) );
    
    Bs := List( Bs, b -> b * KK );
    
    n := Length( Bs );
    
    Perform( [ 1 .. n ], function( i ) Bs[i]![1001] := kG; end );
    
    Bs := List( Bs, BlockOfIdempotent );
    
    Perform( [ 1 .. n ],
            function( i )
              if Length( bs[i] ) = 1 then
                  SetAssociatedTableBlock( Bs[i], bs[i][1] );
                  SetIsBlock( Bs[i], true );
              else
                  SetAssociatedTableBlock( Bs[i], bs[i] );
                  SetIsBlock( Bs[i], false );
              fi;
          end );
    
    List( Bs, B -> [ Dimension( B ), IsPrincipal( B ), IsReal( B ) ] );
    
    if not HasPrincipalBlock( kG ) then
        B0 := First( Bs, IsPrincipal );
        if IsAlgebra( B0 ) then
            SetPrincipalBlock( kG, B0 );
            Assert( 0, IsOne( Sum( CoefficientsBySupport( One( B0 ) ) ) ) );
        fi;
    fi;
    
    if UnderlyingCharacteristic( b ) = 2 then
        List( Bs, IsSpecial );
    fi;
    
    return Bs;
    
end );

##
InstallMethod( CorrespondingMaximalIdeal,
        [ IsMultiplicativeElementWithInverse, IsHomalgModule ],
        
  function( g, M )
    local b, m;
    
    if not IsBound( M!.UnitOfAlgebra ) then
        Error( "component `UnitOfAlgebra' unbound\n" );
    fi;
    
    b := M!.UnitOfAlgebra;
    
    g := Coefficients( M, Coerce( One( M!.GroupAlgebra ), b ) * g );
    
    if g = fail then
        return fail;
    fi;
    
    m := GeneralElement( M );
    m := UnderlyingMorphism( m );
    m := MatrixOfMap( m );
    m := EntriesOfHomalgMatrix( m );
    
    return LeftSubmodule( m - g );
    
end );

##
InstallMethod( CorrespondingMaximalIdeal,
        [ IsMultiplicativeElementWithInverse, IsHomalgFiltration ],
        
  function( g, filt )
    local M, b, N, n;
    
    M := UnderlyingObject( filt );
    
    if not IsBound( M!.UnitOfAlgebra ) then
        Error( "component `M!.UnitOfAlgebra' unbound\n" );
    fi;
    
    b := M!.UnitOfAlgebra;
    
    g := Coefficients( filt, Coerce( One( M!.GroupAlgebra ), b ) * g );
    
    if g = fail then
        return fail;
    fi;
    
    N := CertainObject( filt, 0 );
    
    n := Indeterminates( N!.AffineCoordinateRing );
    
    return LeftSubmodule( n - g );
    
end );
