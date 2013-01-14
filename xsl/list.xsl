<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:b="urn:backbase-functions"
    version="1.0"
    exclude-result-prefixes="b"
    >

    <xsl:output method="html"/>

    <xsl:template name="b:format-date">
        <xsl:param name="date" select="'30.11.2011T00:00.00'"/>
        <xsl:variable name="day" select="round(substring($date,1,2))"/>
        <xsl:variable name="m" select="substring($date,4,2)"/>
        <xsl:variable name="month">
            <xsl:choose>
                <xsl:when test="$m = '01'">Jan</xsl:when>
                <xsl:when test="$m = '02'">Feb</xsl:when>
                <xsl:when test="$m = '03'">Mar</xsl:when>
                <xsl:when test="$m = '04'">Apr</xsl:when>
                <xsl:when test="$m = '05'">May</xsl:when>
                <xsl:when test="$m = '06'">Jun</xsl:when>
                <xsl:when test="$m = '07'">Jul</xsl:when>
                <xsl:when test="$m = '08'">Aug</xsl:when>
                <xsl:when test="$m = '09'">Sep</xsl:when>
                <xsl:when test="$m = '10'">Oct</xsl:when>
                <xsl:when test="$m = '11'">Nov</xsl:when>
                <xsl:when test="$m = '12'">Dec</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="year" select="substring($date,7,4)"/>

        <xsl:value-of select="$day"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$month"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$year"/>
    </xsl:template>

    <xsl:template match="/">
        <xsl:apply-templates select="response/newsList"/>
    </xsl:template>

    <xsl:template match="newsList">
        <ul>
            <xsl:apply-templates select="news"/>
        </ul>
    </xsl:template>

    <xsl:template match="newsList/news">
        <li>
            <b>
                <xsl:apply-templates select="title"/>
            </b>
            <div class="article_anno">
                <xsl:apply-templates select="shortText"/>
            </div>
            <div class="article_text"></div>
            <span class="article_load">
                <xsl:attribute name="onclick">
                    <xsl:text>return { 'id': '</xsl:text>
                    <xsl:value-of select="id"/>
                    <xsl:text>' }</xsl:text>
                </xsl:attribute>
                more
            </span>
            <span>
                <xsl:apply-templates select="date"/>
            </span>
        </li>
    </xsl:template>

    <xsl:template match="date">
        <xsl:call-template name="b:format-date">
            <xsl:with-param name="date" select="."/>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
