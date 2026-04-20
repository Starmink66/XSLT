<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
<xsl:key name="teacher-name" match="/courses/course/teachers/teacher" use="."/>  
<xsl:key name="keyword-name" match="/courses/course/keywords/keyword" use="."/>
  
  <xsl:template match="/">
    <html>
      <h1>Наши курсы</h1>
      <h3>Курсы, которые читает Борисов И.О.</h3>
      <ul>
        <xsl:for-each select="key('teacher-name', 'Борисов И.О.')">
          <li>
            <xsl:value-of select="../../title" />
          </li>
        </xsl:for-each>
    </ul>
    <h3>Курсы, которые используют XML</h3>
    <ul>
        <xsl:for-each select="key('keyword-name', 'XML')">
          <li>
            <xsl:value-of select="../../title" />
          </li>
        </xsl:for-each>
    </ul>
    <h3>Курсы, которые читает Борисов И.О. и используют тему XSLT</h3>
    <ul>
        <xsl:for-each select="key('teacher-name', 'Борисов И.О.') [../../keywords/keyword = 'XSLT']">
          <li>
            <xsl:value-of select="../../title" />
          </li>
        </xsl:for-each>
    </ul>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
