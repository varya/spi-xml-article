<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    >

    <xsl:output method="html"/>

    <xsl:template match="/">
        <xsl:apply-templates select="response/newsList/news[id = $articleId]"/>
    </xsl:template>

    <xsl:template match="newsList/news">
        <div>
            <xsl:value-of select="text"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
