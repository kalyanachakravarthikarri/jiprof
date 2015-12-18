<?xml version="1.0"?>
<!-- 
   The source code contained herein is licensed under the IBM International
   License Agreement for Non-Warranted Sample Code.  
   Copyright (C) 2001, 2003 International Business Machines Corporation
   All Rights Reserved.
  -->
  <!-- tdc 09/18 Updates:  None; renamed this file to keep version/release same as master stylesheet -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xsl fo">
 <xsl:template name="ReplaceSubstring">
    <xsl:param name="original"/>
    <xsl:param name="substring"/>
    <xsl:param name="replacement" select="''"/>
    <xsl:variable name="first">
      <xsl:choose>
        <xsl:when test="contains($original, $substring)">
          <xsl:value-of select="substring-before($original, $substring)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$original"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="middle">
      <xsl:choose>
        <xsl:when test="contains($original, $substring)">
          <xsl:value-of select="$replacement"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text></xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="last">
      <xsl:choose>
        <xsl:when test="contains($original, $substring)">
          <xsl:choose>
            <xsl:when test="contains(substring-after($original, $substring), $substring)">
              <xsl:call-template name="ReplaceSubstring">
                <xsl:with-param name="original"><xsl:value-of select="substring-after($original, $substring)"/></xsl:with-param>
                <xsl:with-param name="substring"><xsl:value-of select="$substring"/></xsl:with-param>
                <xsl:with-param name="replacement"><xsl:value-of select="$replacement"/></xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring-after($original, $substring)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text></xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="concat($first, $middle, $last)"/>
  </xsl:template>
</xsl:stylesheet>


