# SPDX-License-Identifier: GPL-2.0-or-later
# Blocks: Tools for block theory
#
# Declarations
#

#! @Chapter Tools

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments M
DeclareOperation( "GeneralElement",
        [ IsHomalgModule ] );

#! @Arguments filt
DeclareAttribute( "GeneralElementsOfFiltration",
        IsHomalgFiltration );

#! @Arguments m
DeclareAttribute( "AsElementOfAlgebra",
        IsHomalgModuleElement );

#! @Arguments M
DeclareAttribute( "Antipode",
        IsHomalgModule );

####################################
#
#! @Section Operations
#
####################################

#! @Arguments phi, filt
DeclareOperation( "GradedPartsOfFilteredMorphism",
        [ IsHomalgMorphism, IsHomalgFiltration ] );

#! @Arguments m
DeclareOperation( "ExtractDefiningIdeal",
        [ IsHomalgModuleElement ] );
