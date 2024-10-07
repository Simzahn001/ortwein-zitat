<?xml version="1.0" ?>

<!--This guide saved me:
https://learn.microsoft.com/en-us/office/vba/word/concepts/objects-properties-methods/create-custom-bibliography-styles-->


<!--List of the external resources that we are referencing-->
<xsl:stylesheet version="1.0" xmlns:xsl="https://www.w3.org/1999/XSL/Transform" xmlns:b="https://schemas.openxmlformats.org/officeDocument/2006/bibliography">

<!--When the bibliography or citation is in your document, it's just HTML-->
<xsl:output method="html" encoding="us-ascii"/>

<!--Match the root element, and dispatch to its children-->
<xsl:template match="/">

    <xsl:apply-templates select="*" />

</xsl:template>

<!--Set an optional version number for this style-->
<xsl:template match="b:version">

    <xsl:text>0.1</xsl:text>

</xsl:template>

<!--The microsoft local id's:
https://learn.microsoft.com/en-us/openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a-->
<xsl:when test="b:StyleNameLocalized/b:Lcid='1031'">

    <xsl:text>Ortweinzitat</xsl:text>

</xsl:when>

<!--Defines the name of the style in the References dropdown list-->
<xsl:when test="b:StyleNameLocalized">
    <xsl:choose>
    <xsl:when test="b:StyleNameLocalized/b:Lcid='1031'">
        <xsl:text>Ortwein Zitat</xsl:text>
    </xsl:when>
</xsl:when>

<!--Specifies which fields should appear in the Create Source dialog box when in a collapsed state
(The Show All Bibliography Fields check box is cleared)-->
<!--Examples of your sources can be found in the %APPDATA%/Microsoft/Bibliography/Sources.xml file.-->
<xsl:template match="b:GetImportantFields[b:SourceType = 'Book']">
    <b:ImportantFields>
        <b:ImportantField>
            <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
        </b:ImportantField>
        <b:ImportantField>
            <xsl:text>b:Title</xsl:text>
        </b:ImportantField>
        <b:ImportantField>
            <xsl:text>b:State/Province</xsl:text>
        </b:ImportantField>
        <b:ImportantField>
            <xsl:text>b:Publisher</xsl:text>
        </b:ImportantField>
        <b:ImportantField>
            <xsl:text>b:Year</xsl:text>
        </b:ImportantField>
    </b:ImportantFields>
</xsl:template>