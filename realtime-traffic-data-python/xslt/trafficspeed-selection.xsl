<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                              xmlns:pub="http://datex2.eu/schema/2/2_0"
                              xmlns:xsi="http://www.w3.org/2001/XMLSchemainstance">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/soapenv:Envelope">
    <xsl:text>publicationTime,country,nationalIdentifier,msmtSiteTableRef_targetClass,msmtSiteTableRef_version,msmtSiteTableRef_id,</xsl:text>
    <xsl:text>msmtSiteRef_targetClass,msmtSiteRef_version,msmtSiteRef_id,measurementTimeDefault,</xsl:text>
    <xsl:text>measuredValue_index,basicData_type,vehicleFlowRate,averageVehicleSpeed_numberOfInputValues,averageVehicleSpeed_value</xsl:text>
    <xsl:text>&#xa;</xsl:text>
    <xsl:apply-templates select="soapenv:Body"/>
  </xsl:template>

  <xsl:template match="soapenv:Body">
    <xsl:apply-templates select="pub:d2LogicalModel"/>
  </xsl:template>

  <xsl:template match="pub:d2LogicalModel">
    <xsl:apply-templates select="pub:payloadPublication"/>
  </xsl:template>

  <xsl:template match="pub:payloadPublication">
    <xsl:apply-templates select="pub:siteMeasurements"/>
  </xsl:template>

  <xsl:template match="pub:siteMeasurements">
    <xsl:apply-templates select="pub:measuredValue"/>
  </xsl:template>

  <xsl:template match="pub:measuredValue">
    <xsl:value-of select="concat(ancestor::pub:payloadPublication/pub:publicationTime,',',
                                 ancestor::pub:payloadPublication/pub:publicationCreator/pub:country,',',
                                 ancestor::pub:payloadPublication/pub:publicationCreator/pub:nationalIdentifier,',',
                                 ancestor::pub:payloadPublication/pub:measurementSiteTableReference/@targetClass,',',
                                 ancestor::pub:payloadPublication/pub:measurementSiteTableReference/@version,',',
                                 ancestor::pub:payloadPublication/pub:measurementSiteTableReference/@id,',',
                                 ancestor::pub:payloadPublication/pub:siteMeasurements/pub:measurementSiteReference/@targetClass,',',
                                 ancestor::pub:payloadPublication/pub:siteMeasurements/pub:measurementSiteReference/@version,',',
                                 ancestor::pub:payloadPublication/pub:siteMeasurements/pub:measurementSiteReference/@id,',',
                                 ancestor::pub:siteMeasurements/pub:measurementTimeDefault,',',
                                 @index,',',
                                 pub:measuredValue/pub:basicData/@xsi:type,',',
                                 descendant::pub:vehicleFlowRate,',',
                                 descendant::pub:averageVehicleSpeed/@numberOfInputValuesUsed,',',
                                 descendant::pub:speed)"/><xsl:text>&#xa;</xsl:text>    
  </xsl:template>

</xsl:stylesheet>