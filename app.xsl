<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
      version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

      <xsl:output method="html"/>

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
              <a href="#">
                  <xsl:apply-templates select="title"/>
              </a>
              <div>
                  <xsl:apply-templates select="shortText"/>
              </div>
              <span>
                  <xsl:apply-templates select="date"/>
              </span>
          </li>
      </xsl:template>

</xsl:stylesheet>
