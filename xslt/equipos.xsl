<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

    <!--  Almacena los datos del entrenador deseado -->
    <xsl:variable name="entrenador"
        select="/club_voleibol/equipo/entrenador[nombre='Julio Velasco']" />

    <xsl:template match="/club_voleibol">

        <!-- HTML -->
        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>

                <main>
                    <xsl:apply-templates select="equipo" />
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para elementos equipo -->
    <xsl:template match="equipo">
        <xsl:if test="entrenador/nombre=$entrenador/nombre">
            <section>
                <h1>
                    <a href="{entrenador/url}">
                        <xsl:value-of select="entrenador/nombre" />
                    </a>
                </h1>
                <article class="equipos">
                    <h4>
                        <xsl:value-of select="nombre" />
                    </h4>
                    <xsl:apply-templates select="jugadores/jugador[@titular='si']" />
                </article>
            </section>
        </xsl:if>
    </xsl:template>


    <!-- Plantilla para jugadores que sean titulares -->
    <xsl:template match="jugadores/jugador[@titular='si']">
        <p><xsl:value-of select="@camiseta" /> - <xsl:value-of select="nombre" /></p>
    </xsl:template>

</xsl:stylesheet>