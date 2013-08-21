#############################################################################
##
##  Blocks.gd                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for blocks.
##
#############################################################################


# our info class:
DeclareInfoClass( "InfoBlocks" );
SetInfoLevel( InfoBlocks, 1 );

# a central place for configurations:
DeclareGlobalVariable( "BLOCKS" );

####################################
#
# attributes:
#
####################################

#! @AutoDoc

#! @Chapter Blocks
#! Intro to chapter

#! @Section Attributes
#! Attributes of Blocks

#! @Description
#!  Computes the list of defects of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Returns a list
#! @Arguments modtbl
#! @Group DefectsOfBlocks
DeclareAttribute( "DefectsOfBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the list of lists of degrees of ordinary characters
#!  associated to the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Returns a list
#! @Arguments modtbl
#! @Group CharacterDegreesOfBlocks
DeclareAttribute( "CharacterDegreesOfBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the list of lists of degrees of Brauer characters
#!  associated to the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Returns a list
#! @Arguments modtbl
#! @Group BrauerCharacterDegreesOfBlocks"
DeclareAttribute( "BrauerCharacterDegreesOfBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Returns a list
#! @Arguments modtbl
#! @Group CartanMatricesOfBlocks
DeclareAttribute( "CartanMatricesOfBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the central character for each <A>p</A>-block of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>
#! @Returns a list
#! @Arguments modtbl
#! @Group CentralCharactersOfBlocks
DeclareAttribute( "CentralCharactersOfBlocks",
        IsBrauerTable );


#! @Description
#!  Associates to a <M>p</M>-block idempotent <A>b</A> of a group <M>G</M>
#!  with <A>p</A>-modular character table <M>modtbl</M>
#!  the corresponding record in <C>BlocksInfo</C>(<M>modtbl</M>)
#!  (&see; <Ref Attr="BlocksInfo" BookName="Reference"/>).
#! @Returns a record
#! @Arguments b
#! @Group BlockIdempotentInfo
DeclareAttribute( "BlockIdempotentInfo",
        IsElementOfFreeMagmaRing, "mutable" );

####################################
#
# global functions and operations:
#
####################################

# basic operations:
#! @Section Operations

#! Section headline

#! @Returns a list
#! @Arguments ordtbl, p
#! @Group DefectsOfBlocks
DeclareOperation( "DefectsOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Description
#!  <#Include Label="DefectsOfBlocks">
#! @Returns a list
#! @Arguments G, p
#! @Group DefectsOfBlocks
DeclareOperation( "DefectsOfBlocks",
        [ IsGroup, IsInt ] );

#! @Returns a list
#! @Arguments ordtbl, p
#! @Group CharacterDegreesOfBlocks
DeclareOperation( "CharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Description
#!  <#Include Label="CharacterDegreesOfBlocks">
#! @Returns a list
#! @Arguments G, p
#! @Group CharacterDegreesOfBlocks
DeclareOperation( "CharacterDegreesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Returns a list
#! @Arguments ordtbl, p
#! @Group BrauerCharacterDegreesOfBlocks
DeclareOperation( "BrauerCharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Description
#!  <#Include Label="BrauerCharacterDegreesOfBlocks">
#! @Returns a list
#! @Arguments G, p
#! @Group BrauerCharacterDegreesOfBlocks
DeclareOperation( "BrauerCharacterDegreesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Returns a list
#! @Arguments ordtbl, p
#! @Group CartanMatricesOfBlocks
DeclareOperation( "CartanMatricesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Description
#!  <#Include Label="CartanMatricesOfBlocks">
#! @Returns a list
#! @Arguments G, p
#! @Group CartanMatricesOfBlocks
DeclareOperation( "CartanMatricesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Returns a list
#! @Arguments ordtbl, p
#! @Group CentralCharactersOfBlocks
DeclareOperation( "CentralCharactersOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Description
#!  <#Include Label="CentralCharactersOfBlocks">
#! @Returns a list
#! @Arguments G, p
#! @Group CentralCharactersOfBlocks
DeclareOperation( "CentralCharactersOfBlocks",
        [ IsGroup, IsInt ] );
