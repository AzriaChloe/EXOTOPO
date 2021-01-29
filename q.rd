<resource schema="EXOTOPO">
  <meta name="title">Topography of Exoplanets </meta>
  <meta name="description" format="plain">"DESCRIPTION"</meta>
 
  <meta name="creationDate">2020-09-14T09:42:00Z</meta>
  <meta name="subject">Planet</meta>
  <meta name="subject">Exoplanet</meta>
  <meta name="subject">Topography</meta>
  <meta name="subject">Simulation</meta>
  <meta name="subject">Multifractal</meta>
  <meta name="subject">Roughness</meta>
  <meta name="copyright">GEOPS</meta>
  <meta name="creator.name">Chloe Azria</meta>
  <meta name="publisher">IPSL/GEOPS</meta>
  <meta name="contact.name">Schmidt Frederic|Andrieu Francois</meta>
  <meta name="contact.email"> </meta>
  <meta name="contact.address">GEOPS, batiment 339 Rue du Belvedere Campus Universitaire d'Orsay 91400 Orsay</meta>
  <meta name="source">Dataset DOI: 10.14768/20181024001.1 ;
  			link: https://data.ipsl.fr/catalog/srv/eng/catalog.search#/metadata/60110bbd-e7f1-4d03-9e84-7ac38feb2499</meta>
  <meta name="contentLevel">University</meta>
  <meta name="contentLevel">Research</meta>
  <meta name="utype">ivo://vopdc.obspm/std/EpnCore#schema-2.0</meta>


  <table id="epn_core" onDisk="true" adql="True" primary="granule_uid">
	<mixin spatial_frame_type="body"
		optional_columns= "file_name access_url access_format access_estsize publisher bib_reference thumbnail_url" >
		//epntap2#table-2_0
	</mixin>

	<column name="random_seed"  
		type="text"
		tablehead="random_seed_identifier"
		description="The identifier of the random seed"
		ucd="meta.id"
		verbLevel="1"/>

	<column name="alpha"  
		type="double precision"
		tablehead="alpha : degree of multifractality"  
		unit=""
		description="Degree of multifractality"
		ucd="phys"
		verbLevel="1"/>

	<column name="C1"  
		type="double precision"
		tablehead="C1 : degree of intermittency"  
		description="Degree of intermittency"
		ucd="phys"
		verbLevel="1"/>

	<column name="H"  
		type="double precision"
		tablehead="H : degree of smoothness"  
		unit=""
		description="Degree of smoothness"
		ucd="phys"
		verbLevel="1"/>
		
	<column name="latitude_sampling"  
		type="double precision"
		tablehead="Latitude Sampling for simulation"  
		description="Latitude Sampling for simulation"
		ucd="pos.bodyrc.lat;pos.resolution"
		verbLevel="15"/>
		
	<column name="longitude_sampling"  
		type="double precision"
		tablehead="Longitude Sampling for simulation"  
		description="Latitude Sampling for simulation"
		ucd="pos.bodyrc.lon;pos.resolution"
		verbLevel="15"/>
		
	<column name="content_type"  
		type="text"
		tablehead="Type of map contained in the file"  
		unit=""
		description="Describe the content of the file. TOPO: file containing topographic data; {GRAY|COLO}{SHAD|FLAT}, texture maps for the simulated planet :{SHAD : Shades of grey|COLO :Earth-like colorscale}{SHAD :with Shadows|FLAT : without Shadows}"
		ucd="meta"
		verbLevel="2"/>
		
	<column name="alternative_thumbnail_url"  
		type="text"
		tablehead="Alternative TOPO 3D plot"  
		unit=""
		description="URL of a represantation of a 3D plot of the topography in shades of gray (Asteroid-like)"
		ucd="meta.ref.url;meta.preview"
		verbLevel="2"/>	
			
	<column name="external_link"  
		type="text"
		tablehead="Link to former dataset"  
		unit=""
		description="Web page providing more details on the granule."
		ucd="meta.ref.url"
		verbLevel="2"/>
  </table>



<!-- TABLE COMPLETE -->

  <data id="import">
	<sources>metadata.csv</sources>
	<csvGrammar>
		<rowfilter procDef="//products#define">
			<bind name="table">"\schema.epn_core"</bind>
			<code>
				
				if "TOPO" in @content_type :
					@access_estsize=64000
					@measurement_type="pos.bodyrc.alt"
					@access_url="https://data.ipsl.fr/multifractal-topography/"+@filepath+@filename	
					@access_format="application/fits"
					@thumbnail_url="https://data.ipsl.fr/multifractal-topography/"+@filepath+"Thumbnails/"+"Thumbnail_"+@filename[0:-9]+"COLOTOPO.png"
					@alternative_thumbnail_url="https://data.ipsl.fr/multifractal-topography/"+@filepath+"Thumbnails/"+"Thumbnail_"+@filename[0:-9]+"GRAYTOPO.png"				
					
				else :
					@measurement_type="phys"
					@access_url="https://data.ipsl.fr/multifractal-topography/"+@filepath+@filename
					@access_format="image/png"
					@thumbnail_url="https://data.ipsl.fr/multifractal-topography/"+@filepath[0:-9]+"/Thumbnails/"+"Thumbnail_"+@filename
										
					if "GRAYFLAT" in @content_type :
						@access_estsize=28
						@access_url="https://data.ipsl.fr/multifractal-topography/TextureGRAYFLAT/LAT2001_LON4000GRAYFLAT.png"
						@thumbnail_url="https://data.ipsl.fr/multifractal-topography/TextureGRAYFLAT/Thumbnail_LAT2001_LON4000GRAYFLAT.png"
					
					else :						
						@access_estsize=5000

				yield row
				
			</code>
		</rowfilter>			
	</csvGrammar>

	<make table="epn_core">
		<rowmaker idmaps="*">

		<!--varying valued columns-->
		<!-- <var key="[column name 1]" source="[source column name]"/> -->
			<var key="file_name" source="filename"/>		
			<var key="granule_uid"> @filename[0:-5]</var>
			<var key="granule_gid" source="content_type" />
			<var key="obs_id">@filename[0:15]</var>
								
		<!--constant valued columns-->
		<!-- <var key="[column name 1]">"[value]"</var> -->
			<var key="external_link">"https://data.ipsl.fr/catalog/srv/eng/catalog.search#/metadata/60110bbd-e7f1-4d03-9e84-7ac38feb2499"</var>
			<var key="service_title">"EXOTOPO" </var>
			<var key="spatial_frame_type">"body"</var>			
			<var key="dataproduct_type">"ma"</var> 
			<var key="target_name">""</var>
																
			<var key="bib_reference">"doi:10.14768/20181024001.1"</var>
			<var key="publisher">"GEOPS, IPSL" </var>				
			<var key="instrument_name">"sourcecode : simu_spheric"</var>
			
			<var key="creation_date">"2020-09-15T07:54:00.00" </var>
			<var key="modification_date">"2020-09-15T17:54:00.00" </var>
			<var key="release_date">"2020-09-15T07:54:00.00" </var>							
					
			<var key="c1min">0</var><!--longitude-->
			<var key="c1max">360</var>
			<var key="c2min">-90</var><!--latitude-->
			<var key="c2max">+90</var>
								
			
			<var key="c1_resol_min">(float(@c1max)-float(@c1min))/float(@longitude_sampling)</var>
			<var key="c1_resol_max">(float(@c1max)-float(@c1min))/float(@longitude_sampling)</var>
			<var key="c2_resol_min">(float(@c2max)-float(@c2min))/float(@latitude_sampling)</var>
			<var key="c2_resol_max">(float(@c2max)-float(@c2min))/float(@latitude_sampling)</var>						



			<apply procDef="//epntap2#populate-2_0" name="fillepn">
				<bind name="granule_gid">@granule_gid</bind>
				<bind name="granule_uid">@granule_uid</bind>
				<bind name="obs_id">@obs_id</bind>

				<bind name="c1min">@c1min</bind>	
				<bind name="c1max">@c1max</bind>
				<bind name="c2min">@c2min</bind>
				<bind name="c2max">@c2max</bind>
				<bind name="c1_resol_min">@c1_resol_min</bind>			
				<bind name="c1_resol_max">@c1_resol_max</bind>
				<bind name="c2_resol_min">@c2_resol_min</bind>
				<bind name="c2_resol_max">@c2_resol_max</bind>
				
<!--<bind name="external_link">@external_link</bind> -->
											
				<bind name="target_class">"exoplanet"</bind>
				<bind name="instrument_host_name">""</bind>
				<bind name="instrument_name">@instrument_name</bind>
				<bind name="target_name">@target_name</bind>
				<bind name="measurement_type">@measurement_type</bind>
				<bind key="processing_level">5</bind> 
				<bind name="dataproduct_type">@dataproduct_type</bind>
				<bind name="service_title">@service_title</bind>
				<bind name="creation_date">@creation_date</bind>
				<bind name="modification_date">@modification_date</bind>
				<bind name="release_date">@release_date</bind>

			</apply>
		</rowmaker>
	</make>
  </data>
</resource>
