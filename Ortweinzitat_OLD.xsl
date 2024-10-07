<?xml version="1.0" ?>
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
    <xsl:text>2024.10.07</xsl:text>
  </xsl:template>
  <!--The microsoft local id's:
  https://learn.microsoft.com/en-us/openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a-->
  <xsl:template match="b:StyleName">
    <xsl:text>Ortweinzitat</xsl:text>
  </xsl:template>
  <!--Specifies which fields should appear in the Create Source dialog box when in a collapsed state
  (The Show All Bibliography Fields check box is cleared)-->
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
  <!--Defines the output format for a simple Book (in the Bibliography) with important fields defined-->
  <xsl:template match="b:Source[b:SourceType = 'Book']">
    <!--Label the paragraph as an Office Bibliography paragraph-->
    <p>
      <xsl:value-of select="b:Author/b:Author/b:NameList/b:Person/b:Last"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:Author/b:Author/b:NameList/b:Person/b:First"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="b:Title"/>
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:Title"/>
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:State/Province"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="b:Publisher"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="b:Year"/>
      <xsl:text>, S.</xsl:text>
    </p>
  </xsl:template>
  <!--Defines the output of the entire Bibliography-->
  <xsl:template match="b:Bibliography">
    <html xmlns="https://www.w3.org/TR/REC-html40">
      <body>
        <xsl:apply-templates select ="b:Source[b:SourceType = 'Book']">
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  <!--Defines the output of the Citation-->
  <xsl:template match="b:Citation/b:Source[b:SourceType = 'Book']">
    <html xmlns="https://www.w3.org/TR/REC-html40">
      <body>
        <xsl:apply-templates select ="b:Source[b:SourceType = 'Book']">
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="text()" />
</xsl:stylesheet>
