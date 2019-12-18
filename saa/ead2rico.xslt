<?xml version="1.0" encoding="UTF-8"?>

<!-- XSLT stylesheet converting City Archives Amsterdam examples -->
<!-- Endocoded Archival Description 2002 (EAD) into Records in Contexts Ontology (RiC-O) 0.1-->
<!-- Ivo Zandhuis (ivo@zandhuis.nl) 20191218 -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="baseUri">http://example.com/</xsl:param>

<!-- RDF wrap, looping hierarchy -->
<xsl:template match="ead">
    <rdf:RDF>
        <xsl:apply-templates select="archdesc"/>
    </rdf:RDF>
</xsl:template>

<!-- creating subjects -->
<xsl:template match="archdesc">
    <rico:RecordSet>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="did/@id"/>
        </xsl:attribute>
        <xsl:apply-templates select="did"/>
    </rico:RecordSet>
    <xsl:apply-templates select="dsc"/>    
</xsl:template>

<xsl:template match="dsc">
    <xsl:apply-templates select="c01"/>
</xsl:template>

<xsl:template match="c01">
    <xsl:choose>
        <xsl:when test="@level='item'">
            <rico:Record>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="$baseUri"/>
                    <xsl:value-of select="did/@id"/>
                </xsl:attribute>
                <rico:includedIn>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="$baseUri"/>
                        <xsl:value-of select="../../did/@id"/>
                    </xsl:attribute>
                </rico:includedIn>  
                <xsl:apply-templates select="did"/>
            </rico:Record>
        </xsl:when>
        <xsl:otherwise>
            <rico:RecordSet>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="$baseUri"/>
                    <xsl:value-of select="did/@id"/>
                </xsl:attribute>
                <rico:includedIn>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="$baseUri"/>
                        <xsl:value-of select="../../did/@id"/>
                    </xsl:attribute>
                </rico:includedIn>  
                <xsl:apply-templates select="did"/>
            </rico:RecordSet>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="c02"/>
</xsl:template>

<xsl:template match="c02 | c03 | c04 | c05 | c06 | c07 | c08 | c09 | c10 | c11 | c12">
    <xsl:choose>
        <xsl:when test="@level='item'">
            <rico:Record>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="$baseUri"/>
                    <xsl:value-of select="did/@id"/>
                </xsl:attribute>
                <rico:includedIn>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="$baseUri"/>
                        <xsl:value-of select="../did/@id"/>
                    </xsl:attribute>
                </rico:includedIn>  
                <xsl:apply-templates select="did"/>
            </rico:Record>
        </xsl:when>
        <xsl:otherwise>
            <rico:RecordSet>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="$baseUri"/>
                    <xsl:value-of select="did/@id"/>
                </xsl:attribute>
                <rico:includedIn>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="$baseUri"/>
                        <xsl:value-of select="../did/@id"/>
                    </xsl:attribute>
                </rico:includedIn>  
                <xsl:apply-templates select="did"/>
            </rico:RecordSet>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:apply-templates select="c02"/>
    <xsl:apply-templates select="c03"/>
    <xsl:apply-templates select="c04"/>
    <xsl:apply-templates select="c05"/>
    <xsl:apply-templates select="c06"/>
    <xsl:apply-templates select="c07"/>
    <xsl:apply-templates select="c08"/>
    <xsl:apply-templates select="c09"/>
    <xsl:apply-templates select="c10"/>
    <xsl:apply-templates select="c11"/>
    <xsl:apply-templates select="c12"/>
</xsl:template>

<!-- creating predicates and objects -->
<!-- very preliminary mapping, created in my learning-by-doing way of working! -->
<!-- super minimal: only four basic fields, most important in Dutch Archival Culture -->
<xsl:template match="did">
    <xsl:apply-templates select="unitid"/>
    <xsl:apply-templates select="unittitle"/>
    <xsl:apply-templates select="unitdate"/>
    <xsl:apply-templates select="physdesc"/>
</xsl:template>

<xsl:template match="unitid">
    <rico:identifier>
        <xsl:value-of select="."/>
    </rico:identifier>
</xsl:template>

<xsl:template match="unittitle">
    <rico:hasTitle>
        <xsl:value-of select="."/>
    </rico:hasTitle>
</xsl:template>

<xsl:template match="unitdate">
    <rico:creationDate>
        <xsl:value-of select="."/>
    </rico:creationDate>
</xsl:template>

<xsl:template match="physdesc">
    <rico:recordResourceExtent>
        <xsl:value-of select="."/>
    </rico:recordResourceExtent>
</xsl:template>

</xsl:stylesheet>
