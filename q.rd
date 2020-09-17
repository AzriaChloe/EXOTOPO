<resource schema="TOPO">
  <meta name="title">Topography of Exoplanets </meta>
  <meta name="description" format="plain">
DESCRIPTION </meta>
  <meta name="creationDate">2020-09-14T09:42:00Z</meta>
  <meta name="subject">Planet</meta>
  <meta name="subject">Topography</meta>
  <meta name="subject">Simulation</meta>
  <meta name="subject">Multifractal</meta>
  <meta name="subject">Roughness</meta>
  <meta name="copyright">GEOPS</meta>
  <meta name="creator.name">Chloe Azria</meta>
  <meta name="publisher">IPSL</meta>
  <meta name="contact.name"> </meta>
  <meta name="contact.email">vo.paris@obspm.fr</meta>
  <meta name="contact.address">GEOPS, batiment 339 Rue du Belvedere Campus Universitaire d'Orsay 91400 Orsay</meta>
  <meta name="source">Dataset DOI: 10.14768/20181024001.1</meta>
  <meta name="contentLevel">University</meta>
  <meta name="contentLevel">Research</meta>
  <meta name="utype">ivo://vopdc.obspm/std/EpnCore#schema-2.0</meta>




<!-- METADATA COMPLETE -->

	<table id="epn_core" onDisk="true" adql="True">
		<mixin spatial_frame_type="spherical"
		optional_columns= "time_scale publisher bib_reference" >//epntap2#table-2_0</mixin>
	<!--define ext -->

	    <column name="random_seed"  type="text"
			tablehead="random_seed"
      		description="The identifier of the random seed"
			verbLevel="1"/>

	    <column name="alpha"  type="double precision"
			tablehead="alpha"  unit=""
      		description="Degree of multifractality"
			verbLevel="1"/>

	    <column name="c1"  type="double precision"
			tablehead="c1"  unit=""
      		description="Degree of intermittency"
			verbLevel="1"/>

	    <column name="H"  type="double precision"
			tablehead="H"  unit=""
      		description="Degree of smoothness"
			verbLevel="1"/>

	</table>



<!-- TABLE COMPLETE -->

	<data id="import">
		<sources>data/schema_donnees.csv</sources>
		<csvGrammar>
			<rowfilter procDef="//products#define">
				<bind name="table">"\schema.epn_core"</bind>
			</rowfilter>
		</csvGrammar>

		<make table="epn_core">
			<rowmaker idmaps="*">
				<var key="dataproduct_type">"vo"</var> <!-- volume: 3d structures-->
				<var key="spatial_frame_type">"spherical"</var> <!---->

				
				<!--varying valued columns-->
				<!-- <var key="[column name 1]" source="[source column name]"> -->
				<var key="target_name" source="sim_ref" />
				<var key="granule_uid" source="sim_ref" />
				<var key="granule_gid">"sim_topo" </var>
				<var key="obs_id" source="sim_ref" />
				<!--<var key="target_class">"planet" </var>
				<var key="time_scale">"UTC" </var>-->

				<!--constant valued columns-->
				<!-- <var key="[column name 1]">"[value]"</var> -->
				<var key="creation_date">"2020-09-15T07:54:00.00" </var>
				<var key="modification_date">"2020-09-15T17:54:00.00" </var>
				<var key="release_date">"2020-09-15T07:54:00.00" </var>

				<var key="service_title">"EXOTOPO" </var>
				<var key="bib_reference">"Topography of (exo)planets F.Landais, F.Schmidt, S.Lovejoy. doi:10.1093/mnras/sty3253"</var>
				<var key="publisher">"GEOPS, IPSL" </var>


				<apply procDef="//epntap2#populate-2_0" name="fillepn">
					<bind name="granule_gid">@granule_gid</bind>
					<bind name="granule_uid">@granule_uid</bind>
					<bind name="obs_id">@obs_id</bind>
					<bind name="target_class">"planet"</bind>
					<bind name="time_scale">"UTC"</bind>

					<bind name="target_name">@target_name</bind>
					<!--  <bind name="access_format">""</bind> -->
					<bind name="instrument_host_name">""</bind>
					<bind name="instrument_name">""</bind>


					<bind key="processing_level">5</bind> <!--niveau de traitement des données 6:ancillary (derivée)-->

					<bind name="dataproduct_type">@dataproduct_type</bind>
					<bind name="measurement_type">"phys.mass#phys.size.radius"</bind>


					<bind name="service_title">@service_title</bind>
					<bind name="creation_date">@creation_date</bind>
					<bind name="modification_date">@modification_date</bind>
					<bind name="release_date">@release_date</bind>

				</apply>
			</rowmaker>
		</make>
	</data>
</resource>
