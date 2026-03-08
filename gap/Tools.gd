# SPDX-License-Identifier: GPL-2.0-or-later
# Blocks: Tools for block theory
#
# Declarations
#

#! @Chapter Tools

####################################
#
# @Section Attributes
#
####################################


####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Computes the field of the list <A>e</A> of group ring elements.
#! @Arguments e
#! @Returns a field
DeclareOperation( "FieldOfGroupRingElements",
        [ IsList ] );
#! @InsertChunk FieldOfGroupRingElements

#! @Arguments o, r
DeclareOperation( "Coerce",
        [ IsRingElement, IsMultiplicativeElement ] );

#! @Arguments M, c
DeclareOperation( "Coefficients",
        [ IsHomalgModule, IsElementOfFreeMagmaRing ] );
#! @InsertChunk Coefficient

#! @Arguments filt, c
DeclareOperation( "Coefficients",
        [ IsHomalgFiltration, IsElementOfFreeMagmaRing ] );
#! @InsertChunk Coefficients
