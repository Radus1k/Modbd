-- DELETE FROM hotel_administrator;
-- DELETE FROM administrator;

-- DELETE FROM hotel_facilitate;
-- DELETE FROM facilitate;

-- DELETE FROM rezervare_tip_camera;
-- DELETE FROM rezervare;

-- DELETE FROM recenzie;
-- DELETE FROM client;

-- DELETE FROM hotel_tip_camera;
-- DELETE FROM tip_camera;

-- DELETE FROM hotel;
-- DELETE FROM localitate;
-- DELETE FROM judet;
-- DELETE FROM regiune;


CALL insereaza_in_regiune(1,'Dobrogea'::TEXT);
CALL insereaza_in_regiune(2,'Muntenia'::TEXT);
CALL insereaza_in_regiune(3,'Oltenia'::TEXT);
CALL insereaza_in_regiune(4,'Banat'::TEXT);
CALL insereaza_in_regiune(5,'Moldova'::TEXT);
CALL insereaza_in_regiune(6,'Transilvania'::TEXT);
CALL insereaza_in_regiune(7,'Crisana'::TEXT);
CALL insereaza_in_regiune(8,'Bucovina'::TEXT);
CALL insereaza_in_regiune(9,'Maramures'::TEXT);
-- SELECT * FROM regiune ORDER BY id_regiune;

CALL insereaza_in_judet('Tulcea', gaseste_id_regiune_cu_nume('Dobrogea'::TEXT));
CALL insereaza_in_judet('Constanta', gaseste_id_regiune_cu_nume('Dobrogea'::TEXT));
CALL insereaza_in_judet('Braila', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Ialomita', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Calarasi', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Buzau', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Ilfov', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Bucuresti', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Giurgiu', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Prahova', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Dambovita', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Arges', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Teleorman', gaseste_id_regiune_cu_nume('Muntenia'::TEXT));
CALL insereaza_in_judet('Valcea', gaseste_id_regiune_cu_nume('Oltenia'::TEXT));
CALL insereaza_in_judet('Olt', gaseste_id_regiune_cu_nume('Oltenia'::TEXT));
CALL insereaza_in_judet('Dolj', gaseste_id_regiune_cu_nume('Oltenia'::TEXT));
CALL insereaza_in_judet('Gorj', gaseste_id_regiune_cu_nume('Oltenia'::TEXT));
CALL insereaza_in_judet('Mehedinti', gaseste_id_regiune_cu_nume('Oltenia'::TEXT));
CALL insereaza_in_judet('Timis', gaseste_id_regiune_cu_nume('Banat'::TEXT));
CALL insereaza_in_judet('Caras-Severin', gaseste_id_regiune_cu_nume('Banat'::TEXT));
CALL insereaza_in_judet('Iasi', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Vaslui', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Galati', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Neamt', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Bacau', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Vrancea', gaseste_id_regiune_cu_nume('Moldova'::TEXT));
CALL insereaza_in_judet('Harghita', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Covasna', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Bistrita Nasaud', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Mures', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Brasov', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Salaj', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Cluj', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Alba', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Sibiu', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Hunedoara', gaseste_id_regiune_cu_nume('Transilvania'::TEXT));
CALL insereaza_in_judet('Bihor', gaseste_id_regiune_cu_nume('Crisana'::TEXT));
CALL insereaza_in_judet('Arad', gaseste_id_regiune_cu_nume('Crisana'::TEXT));
CALL insereaza_in_judet('Maramures', gaseste_id_regiune_cu_nume('Maramures'::TEXT));
CALL insereaza_in_judet('Satu Mare', gaseste_id_regiune_cu_nume('Maramures'::TEXT));
CALL insereaza_in_judet('Botosani', gaseste_id_regiune_cu_nume('Bucovina'::TEXT));
CALL insereaza_in_judet('Suceava', gaseste_id_regiune_cu_nume('Bucovina'::TEXT));


CALL insereaza_in_localitate('Abrud'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Adjud'::TEXT, gaseste_id_judet_cu_nume('Vrancea'::TEXT));
CALL insereaza_in_localitate('Aiud'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Alba Iulia'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Alesd'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Alexandria'::TEXT, gaseste_id_judet_cu_nume('Teleorman'::TEXT));
CALL insereaza_in_localitate('Agnita'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Anina'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Aninoasa'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Arad'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Avrig'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Azuga'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Babadag'::TEXT, gaseste_id_judet_cu_nume('Tulcea'::TEXT));
CALL insereaza_in_localitate('Bacau'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Baia de Arama'::TEXT, gaseste_id_judet_cu_nume('Mehedinti'::TEXT));
CALL insereaza_in_localitate('Baia de Aries'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Baia Mare'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Baia Sprie'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Bals'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Baraolt'::TEXT, gaseste_id_judet_cu_nume('Covasna'::TEXT));
CALL insereaza_in_localitate('Baicoi'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Baile Govora'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Baile Herculane'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Baile Olanesti'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Bailesti'::TEXT, gaseste_id_judet_cu_nume('Dolj'::TEXT));
CALL insereaza_in_localitate('Baile Tusnad'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Balan'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Barlas'::TEXT, gaseste_id_judet_cu_nume('Vaslui'::TEXT));
CALL insereaza_in_localitate('Bocsa'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Borsec'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Beclean'::TEXT, gaseste_id_judet_cu_nume('Bistrita Nasaud'::TEXT));
CALL insereaza_in_localitate('Beius'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Beresti'::TEXT, gaseste_id_judet_cu_nume('Galati'::TEXT));
CALL insereaza_in_localitate('Bicaz'::TEXT, gaseste_id_judet_cu_nume('Neamt'::TEXT));
CALL insereaza_in_localitate('Bistrita'::TEXT, gaseste_id_judet_cu_nume('Bistrita Nasaud'::TEXT));
CALL insereaza_in_localitate('Blaj'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Boldesti Scaieni'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Bolintin Vale'::TEXT, gaseste_id_judet_cu_nume('Giurgiu'::TEXT));
CALL insereaza_in_localitate('Borsa'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Botosani'::TEXT, gaseste_id_judet_cu_nume('Botosani'::TEXT));
CALL insereaza_in_localitate('Brad'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Brasov'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Braila'::TEXT, gaseste_id_judet_cu_nume('Braila'::TEXT));
CALL insereaza_in_localitate('Breaza'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Brezoi'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Bucuresti'::TEXT, gaseste_id_judet_cu_nume('Bucuresti'::TEXT));
CALL insereaza_in_localitate('Budesti'::TEXT, gaseste_id_judet_cu_nume('Calarasi'::TEXT));
CALL insereaza_in_localitate('Buftea'::TEXT, gaseste_id_judet_cu_nume('Ilfov'::TEXT));
CALL insereaza_in_localitate('Buhusi'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Bumbesti Jiu'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Busteni'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Buzias'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Buzau'::TEXT, gaseste_id_judet_cu_nume('Buzau'::TEXT));
CALL insereaza_in_localitate('Calafat'::TEXT, gaseste_id_judet_cu_nume('Dolj'::TEXT));
CALL insereaza_in_localitate('Carei'::TEXT, gaseste_id_judet_cu_nume('Satu Mare'::TEXT));
CALL insereaza_in_localitate('Caracal'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Caransebes'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Cavnic'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Calan'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Calarasi'::TEXT, gaseste_id_judet_cu_nume('Calarasi'::TEXT));
CALL insereaza_in_localitate('Calimanesti Caciulata'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Campeni'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Campia Turzii'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Campina'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Campulung'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Campulung Moldovenesc'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Cehu Silvaniei'::TEXT, gaseste_id_judet_cu_nume('Salaj'::TEXT));
CALL insereaza_in_localitate('Cernavoda'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Chisineu Cris'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Cisnadie'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Cluj Napoca'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Bran'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Comarnic'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Comanesti'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Constanta'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Copsa Mica'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Corabia'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Costesti'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Covasna'::TEXT, gaseste_id_judet_cu_nume('Covasna'::TEXT));
CALL insereaza_in_localitate('Craiova'::TEXT, gaseste_id_judet_cu_nume('Dolj'::TEXT));
CALL insereaza_in_localitate('Cristuru Secuiesc'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Cugir'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Curtici'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Curtea de Arges'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Darabani'::TEXT, gaseste_id_judet_cu_nume('Botosani'::TEXT));
CALL insereaza_in_localitate('Darmanesti'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Dealu'::TEXT, gaseste_id_judet_cu_nume('Giurgiu'::TEXT));
CALL insereaza_in_localitate('Dej'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Deta'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Deva'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Dorohoi'::TEXT, gaseste_id_judet_cu_nume('Botosani'::TEXT));
CALL insereaza_in_localitate('Draganesti Olt'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Dragasani'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Drobeta Turnu Severin'::TEXT, gaseste_id_judet_cu_nume('Mehedinti'::TEXT));
CALL insereaza_in_localitate('Dumbraveni'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Eforie'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Fagaras'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Faget'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Falticeni'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Faurei'::TEXT, gaseste_id_judet_cu_nume('Braila'::TEXT));
CALL insereaza_in_localitate('Fetesti'::TEXT, gaseste_id_judet_cu_nume('Ialomita'::TEXT));
CALL insereaza_in_localitate('Fieni'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Filiasi'::TEXT, gaseste_id_judet_cu_nume('Dolj'::TEXT));
CALL insereaza_in_localitate('Focsani'::TEXT, gaseste_id_judet_cu_nume('Vrancea'::TEXT));
CALL insereaza_in_localitate('Fundulea'::TEXT, gaseste_id_judet_cu_nume('Calarasi'::TEXT));
CALL insereaza_in_localitate('Galati'::TEXT, gaseste_id_judet_cu_nume('Galati'::TEXT));
CALL insereaza_in_localitate('Gaesti'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Geoagiu'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Gheorgheni'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Gherla'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Giurgiu'::TEXT, gaseste_id_judet_cu_nume('Giurgiu'::TEXT));
CALL insereaza_in_localitate('Gura Humorului'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Hateg'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Harlau'::TEXT, gaseste_id_judet_cu_nume('Iasi'::TEXT));
CALL insereaza_in_localitate('Harsova'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Horezu'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Huedin'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Hunedoara'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Husi'::TEXT, gaseste_id_judet_cu_nume('Vaslui'::TEXT));
CALL insereaza_in_localitate('Ianca'::TEXT, gaseste_id_judet_cu_nume('Braila'::TEXT));
CALL insereaza_in_localitate('Iasi'::TEXT, gaseste_id_judet_cu_nume('Iasi'::TEXT));
CALL insereaza_in_localitate('Iernut'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Ineu'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Isaccea'::TEXT, gaseste_id_judet_cu_nume('Tulcea'::TEXT));
CALL insereaza_in_localitate('Insuratei'::TEXT, gaseste_id_judet_cu_nume('Braila'::TEXT));
CALL insereaza_in_localitate('Intorsura Buzaului'::TEXT, gaseste_id_judet_cu_nume('Covasna'::TEXT));
CALL insereaza_in_localitate('Jibou'::TEXT, gaseste_id_judet_cu_nume('Salaj'::TEXT));
CALL insereaza_in_localitate('Jimbolia'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Lehliu Gara'::TEXT, gaseste_id_judet_cu_nume('Calarasi'::TEXT));
CALL insereaza_in_localitate('Lipova'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Ludus'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Lugoj'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Lupeni'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Mangalia'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Marghita'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Macin'::TEXT, gaseste_id_judet_cu_nume('Tulcea'::TEXT));
CALL insereaza_in_localitate('Marasesti'::TEXT, gaseste_id_judet_cu_nume('Vrancea'::TEXT));
CALL insereaza_in_localitate('Medgidia'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Medias'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Miercurea Ciuc'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Mihailesti'::TEXT, gaseste_id_judet_cu_nume('Giurgiu'::TEXT));
CALL insereaza_in_localitate('Mioveni'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Mizil'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Moinesti'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Moldova Noua'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Moreni'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Motru'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Murfatlar'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Nadlac'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Nasaud'::TEXT, gaseste_id_judet_cu_nume('Bistrita Nasaud'::TEXT));
CALL insereaza_in_localitate('Navodari'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Negresti'::TEXT, gaseste_id_judet_cu_nume('Vaslui'::TEXT));
CALL insereaza_in_localitate('Negresti Oas'::TEXT, gaseste_id_judet_cu_nume('Satu Mare'::TEXT));
CALL insereaza_in_localitate('Negru Voda'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Nehoiu'::TEXT, gaseste_id_judet_cu_nume('Buzau'::TEXT));
CALL insereaza_in_localitate('Novaci'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Nucet'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Ocna Mures'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Ocna Sibiului'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Ocnele Mari'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Odobesti'::TEXT, gaseste_id_judet_cu_nume('Vrancea'::TEXT));
CALL insereaza_in_localitate('Odorheiu Secuiesc'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Oltenita'::TEXT, gaseste_id_judet_cu_nume('Calarasi'::TEXT));
CALL insereaza_in_localitate('Onesti'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Oradea'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Oravita'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Orastie'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Orsova'::TEXT, gaseste_id_judet_cu_nume('Mehedinti'::TEXT));
CALL insereaza_in_localitate('Otopeni'::TEXT, gaseste_id_judet_cu_nume('Ilfov'::TEXT));
CALL insereaza_in_localitate('Otelu Rosu'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Ovidiu'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Panciu'::TEXT, gaseste_id_judet_cu_nume('Vrancea'::TEXT));
CALL insereaza_in_localitate('Pascani'::TEXT, gaseste_id_judet_cu_nume('Iasi'::TEXT));
CALL insereaza_in_localitate('Pancota'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Petrila'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Petrosani'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Piatra Neamt'::TEXT, gaseste_id_judet_cu_nume('Neamt'::TEXT));
CALL insereaza_in_localitate('Piatra Olt'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Pitesti'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Ploiesti'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Plopeni'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Pogoanele'::TEXT, gaseste_id_judet_cu_nume('Buzau'::TEXT));
CALL insereaza_in_localitate('Predeal'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Pucioasa'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Radauti'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Ramnicu Sarat'::TEXT, gaseste_id_judet_cu_nume('Buzau'::TEXT));
CALL insereaza_in_localitate('Ramnicu Valcea'::TEXT, gaseste_id_judet_cu_nume('Valcea'::TEXT));
CALL insereaza_in_localitate('Rasnov'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Reghin'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Resita'::TEXT, gaseste_id_judet_cu_nume('Caras-Severin'::TEXT));
CALL insereaza_in_localitate('Roman'::TEXT, gaseste_id_judet_cu_nume('Neamt'::TEXT));
CALL insereaza_in_localitate('Rosiori de Vede'::TEXT, gaseste_id_judet_cu_nume('Teleorman'::TEXT));
CALL insereaza_in_localitate('Rovinari'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Rupea'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Salonta'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Satu Mare'::TEXT, gaseste_id_judet_cu_nume('Satu Mare'::TEXT));
CALL insereaza_in_localitate('Sacele'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Saveni'::TEXT, gaseste_id_judet_cu_nume('Botosani'::TEXT));
CALL insereaza_in_localitate('Sangeorz Bai'::TEXT, gaseste_id_judet_cu_nume('Bistrita Nasaud'::TEXT));
CALL insereaza_in_localitate('Sannicolau Mare'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Scornicesti'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Sebes'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Sebis'::TEXT, gaseste_id_judet_cu_nume('Arad'::TEXT));
CALL insereaza_in_localitate('Seini'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Segarcea'::TEXT, gaseste_id_judet_cu_nume('Dolj'::TEXT));
CALL insereaza_in_localitate('Sfantu Gheorghe'::TEXT, gaseste_id_judet_cu_nume('Covasna'::TEXT));
CALL insereaza_in_localitate('Sibiu'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Sighetu Marmatiei'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Sighisoara'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Simeria'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Sinaia'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Siret'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Slatina'::TEXT, gaseste_id_judet_cu_nume('Olt'::TEXT));
CALL insereaza_in_localitate('Slanic'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Slanic Moldova'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Slobozia'::TEXT, gaseste_id_judet_cu_nume('Ialomita'::TEXT));
CALL insereaza_in_localitate('Solca'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Sovata'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Strehaia'::TEXT, gaseste_id_judet_cu_nume('Mehedinti'::TEXT));
CALL insereaza_in_localitate('Suceava'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Sulina'::TEXT, gaseste_id_judet_cu_nume('Tulcea'::TEXT));
CALL insereaza_in_localitate('Simleu Silvaniei'::TEXT, gaseste_id_judet_cu_nume('Salaj'::TEXT));
CALL insereaza_in_localitate('Stei'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Talmaciu'::TEXT, gaseste_id_judet_cu_nume('Sibiu'::TEXT));
CALL insereaza_in_localitate('Tasnad'::TEXT, gaseste_id_judet_cu_nume('Satu Mare'::TEXT));
CALL insereaza_in_localitate('Targoviste'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Targu Bujor'::TEXT, gaseste_id_judet_cu_nume('Galati'::TEXT));
CALL insereaza_in_localitate('Targu Calinesti'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Targu Frumos'::TEXT, gaseste_id_judet_cu_nume('Iasi'::TEXT));
CALL insereaza_in_localitate('Targu Jiu'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Targu Lapus'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Targu Mures'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Targu Neamt'::TEXT, gaseste_id_judet_cu_nume('Neamt'::TEXT));
CALL insereaza_in_localitate('Targu Ocna'::TEXT, gaseste_id_judet_cu_nume('Bacau'::TEXT));
CALL insereaza_in_localitate('Targu Secuiesc'::TEXT, gaseste_id_judet_cu_nume('Covasna'::TEXT));
CALL insereaza_in_localitate('Tarnaveni'::TEXT, gaseste_id_judet_cu_nume('Mures'::TEXT));
CALL insereaza_in_localitate('Techirghiol'::TEXT, gaseste_id_judet_cu_nume('Constanta'::TEXT));
CALL insereaza_in_localitate('Tecuci'::TEXT, gaseste_id_judet_cu_nume('Galati'::TEXT));
CALL insereaza_in_localitate('Teius'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));
CALL insereaza_in_localitate('Timisoara'::TEXT, gaseste_id_judet_cu_nume('Timis'::TEXT));
CALL insereaza_in_localitate('Tismana'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Titu'::TEXT, gaseste_id_judet_cu_nume('Dambovita'::TEXT));
CALL insereaza_in_localitate('Toplita'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Topoloveni'::TEXT, gaseste_id_judet_cu_nume('Arges'::TEXT));
CALL insereaza_in_localitate('Tulcea'::TEXT, gaseste_id_judet_cu_nume('Tulcea'::TEXT));
CALL insereaza_in_localitate('Turda'::TEXT, gaseste_id_judet_cu_nume('Cluj'::TEXT));
CALL insereaza_in_localitate('Turnu Magurele'::TEXT, gaseste_id_judet_cu_nume('Teleorman'::TEXT));
CALL insereaza_in_localitate('Tandarei'::TEXT, gaseste_id_judet_cu_nume('Ialomita'::TEXT));
CALL insereaza_in_localitate('Ticleni'::TEXT, gaseste_id_judet_cu_nume('Gorj'::TEXT));
CALL insereaza_in_localitate('Uricani'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Urlati'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Urziceni'::TEXT, gaseste_id_judet_cu_nume('Ialomita'::TEXT));
CALL insereaza_in_localitate('Valea lui Mihai'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Vaslui'::TEXT, gaseste_id_judet_cu_nume('Vaslui'::TEXT));
CALL insereaza_in_localitate('Vascau'::TEXT, gaseste_id_judet_cu_nume('Bihor'::TEXT));
CALL insereaza_in_localitate('Vatra Dornei'::TEXT, gaseste_id_judet_cu_nume('Suceava'::TEXT));
CALL insereaza_in_localitate('Valenii de Munte'::TEXT, gaseste_id_judet_cu_nume('Prahova'::TEXT));
CALL insereaza_in_localitate('Vanju Mare'::TEXT, gaseste_id_judet_cu_nume('Mehedinti'::TEXT));
CALL insereaza_in_localitate('Victoria'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Videle'::TEXT, gaseste_id_judet_cu_nume('Teleorman'::TEXT));
CALL insereaza_in_localitate('Viseu de Sus'::TEXT, gaseste_id_judet_cu_nume('Maramures'::TEXT));
CALL insereaza_in_localitate('Vlahita'::TEXT, gaseste_id_judet_cu_nume('Harghita'::TEXT));
CALL insereaza_in_localitate('Vulcan'::TEXT, gaseste_id_judet_cu_nume('Hunedoara'::TEXT));
CALL insereaza_in_localitate('Zalau'::TEXT, gaseste_id_judet_cu_nume('Salaj'::TEXT));
CALL insereaza_in_localitate('Zarnesti'::TEXT, gaseste_id_judet_cu_nume('Brasov'::TEXT));
CALL insereaza_in_localitate('Zimnicea'::TEXT, gaseste_id_judet_cu_nume('Teleorman'::TEXT));
CALL insereaza_in_localitate('Zlatna'::TEXT, gaseste_id_judet_cu_nume('Alba'::TEXT));



CALL insereaza_in_hotel('Hotel Privo'::TEXT,4,'Strada Principala, nr 106'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Targu Mures','Mures')::INT);
CALL insereaza_in_hotel('Conacul Bratescu'::TEXT,4,'Strada Principala, nr 52'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bran','Brasov')::INT);
CALL insereaza_in_hotel('Transylvanian Inn'::TEXT,3,'Strada Principala, nr 125'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bran','Brasov')::INT);
CALL insereaza_in_hotel('The Mansion Boutique Hotel'::TEXT,4,'Strada Principala, nr 101'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Ioana Hotel'::TEXT,5,'Strada Principala, nr 75'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sinaia','Prahova')::INT);
CALL insereaza_in_hotel('Epoque Hotel Relais & Chateaux'::TEXT,5,'Strada Principala, nr 33'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Rosen Villa Sibiu'::TEXT,1,'Strada Principala, nr 140'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sibiu','Sibiu')::INT);
CALL insereaza_in_hotel('Hotel International Iasi'::TEXT,4,'Strada Principala, nr 84'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Iasi','Iasi')::INT);
CALL insereaza_in_hotel('IAKI Conference & Spa Hotel'::TEXT,4,'Strada Principala, nr 53'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Constanta','Constanta')::INT);
CALL insereaza_in_hotel('Republique Hotel'::TEXT,4,'Strada Principala, nr 14'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sibiu','Sibiu')::INT);
CALL insereaza_in_hotel('Hampton by Hilton Cluj-Napoca'::TEXT,3,'Strada Principala, nr 23'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Grand Hotel Continental'::TEXT,5,'Strada Principala, nr 15'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sinaia','Prahova')::INT);
CALL insereaza_in_hotel('Ana Hotels Sport Poiana Brasov'::TEXT,4,'Strada Principala, nr 59'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Hotel Casa Wagner'::TEXT,3,'Strada Principala, nr 29'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Kismet Dao Hostel'::TEXT,1,'Strada Principala, nr 86'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Transylvania Hostel'::TEXT,1,'Strada Principala, nr 122'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Orhieea Residence & Spa'::TEXT,4,'Strada Principala, nr 126'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Casa Rozelor - boutique hotel'::TEXT,4,'Strada Principala, nr 75'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('ibis Styles Bucharest City Center'::TEXT,3,'Strada Principala, nr 138'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Kronwell Brasov Hotel'::TEXT,4,'Strada Principala, nr 11'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Akasha Wellness Retreat'::TEXT,3,'Strada Principala, nr 141'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bran','Brasov')::INT);
CALL insereaza_in_hotel('Hilton Garden Inn Bucharest Old Town'::TEXT,4,'Strada Principala, nr 100'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Centrum House Hostel & Bar'::TEXT,1,'Strada Principala, nr 106'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('The Spot Cosy Hostel'::TEXT,1,'Strada Principala, nr 25'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Belfort Hotel'::TEXT,3,'Strada Principala, nr 147'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Ramada by Wyndham Oradea'::TEXT,4,'Strada Principala, nr 110'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Oradea','Bihor')::INT);
CALL insereaza_in_hotel('Hotel Christina'::TEXT,4,'Strada Principala, nr 149'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Casa Corona'::TEXT,1,'Strada Principala, nr 32'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('JW Marriott Bucharest Grand Hotel'::TEXT,5,'Strada Principala, nr 22'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('La Roata'::TEXT,3,'Strada Principala, nr 49'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Gura Humorului','Suceava')::INT);
CALL insereaza_in_hotel('Caro Hotel'::TEXT,4,'Strada Principala, nr 146'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Hadar Chalet'::TEXT,1,'Strada Principala, nr 93'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Buzau','Buzau')::INT);
CALL insereaza_in_hotel('Hotel Cherica'::TEXT,4,'Strada Principala, nr 137'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Constanta','Constanta')::INT);
CALL insereaza_in_hotel('Golden Tulip Ana Tower Sibiu'::TEXT,4,'Strada Principala, nr 89'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sibiu','Sibiu')::INT);
CALL insereaza_in_hotel('Capitolina City Chic Hotel'::TEXT,3,'Strada Principala, nr 97'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Casa Lia'::TEXT,1,'Strada Principala, nr 140'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sighisoara','Mures')::INT);
CALL insereaza_in_hotel('Lol et Lola Hotel'::TEXT,3,'Strada Principala, nr 83'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Guesthouse La Despani'::TEXT,2,'Strada Principala, nr 30'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Bella Muzica'::TEXT,3,'Strada Principala, nr 98'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Hilton Garden Inn Bucharest Airport'::TEXT,4,'Strada Principala, nr 63'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Otopeni','Ilfov')::INT);
CALL insereaza_in_hotel('Rembrandt Hotel'::TEXT,3,'Strada Principala, nr 141'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Hotel Central Park'::TEXT,4,'Strada Principala, nr 67'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sighisoara','Mures')::INT);
CALL insereaza_in_hotel('Casa Savri'::TEXT,1,'Strada Principala, nr 127'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sighisoara','Mures')::INT);
CALL insereaza_in_hotel('Hotel Radsor'::TEXT,4,'Strada Principala, nr 47'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Baile Herculane','Caras-Severin')::INT);
CALL insereaza_in_hotel('Hotel Cismigiu'::TEXT,4,'Strada Principala, nr 58'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Splendid Conference & Spa Hotel'::TEXT,4,'Strada Principala, nr 86'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Constanta','Constanta')::INT);
CALL insereaza_in_hotel('Taschler Haus'::TEXT,3,'Strada Principala, nr 47'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sighisoara','Mures')::INT);
CALL insereaza_in_hotel('Mandachi Hotel & Spa'::TEXT,4,'Strada Principala, nr 95'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Suceava','Suceava')::INT);
CALL insereaza_in_hotel('Fronius Residence'::TEXT,5,'Strada Principala, nr 25'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sighisoara','Mures')::INT);
CALL insereaza_in_hotel('Armatti Hotel'::TEXT,3,'Strada Principala, nr 46'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Concorde Old Bucharest Hotel'::TEXT,4,'Strada Principala, nr 107'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Vila Katharina'::TEXT,4,'Strada Principala, nr 77'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('The Village Hotel'::TEXT,1,'Strada Principala, nr 106'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Borsa','Maramures')::INT);
CALL insereaza_in_hotel('Platinia Hotel'::TEXT,5,'Strada Principala, nr 43'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Hotel Central'::TEXT,4,'Strada Principala, nr 50'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Ploiesti','Prahova')::INT);
CALL insereaza_in_hotel('Vienna House Easy Airport Bucharest'::TEXT,4,'Strada Principala, nr 125'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Otopeni','Ilfov')::INT);
CALL insereaza_in_hotel('Mercure Bucharest City Center'::TEXT,4,'Strada Principala, nr 67'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Hotel Sonnenhof'::TEXT,4,'Strada Principala, nr 147'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Suceava','Suceava')::INT);
CALL insereaza_in_hotel('Teleferic Grand Hotel'::TEXT,4,'Strada Principala, nr 95'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('K+K Hotel Elisabeta'::TEXT,4,'Strada Principala, nr 55'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Pensiune Restaurant La Cassa'::TEXT,1,'Strada Principala, nr 123'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Viseu de Sus','Maramures')::INT);
CALL insereaza_in_hotel('Hostel Boemia'::TEXT,1,'Strada Principala, nr 2'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Golden Tulip Ana Dome'::TEXT,4,'Strada Principala, nr 149'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Hotel Christina Plus'::TEXT,4,'Strada Principala, nr 14'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Simfonia Boutique Hotel'::TEXT,4,'Strada Principala, nr 139'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Ramnicu Valcea','Valcea')::INT);
CALL insereaza_in_hotel('JugendStube Hostel Brasov'::TEXT,3,'Strada Principala, nr 23'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('UpperHouse'::TEXT,1,'Strada Principala, nr 135'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Casa Luxemburg'::TEXT,3,'Strada Principala, nr 61'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sibiu','Sibiu')::INT);
CALL insereaza_in_hotel('Pensiunea Ana'::TEXT,1,'Strada Principala, nr 99'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bran','Brasov')::INT);
CALL insereaza_in_hotel('Hille Guesthouse'::TEXT,1,'Strada Principala, nr 23'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bran','Brasov')::INT);
CALL insereaza_in_hotel('Babou Maramures'::TEXT,1,'Strada Principala, nr 95'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Borsa','Maramures')::INT);
CALL insereaza_in_hotel('Casa Elvira'::TEXT,3,'Strada Principala, nr 64'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Eforie','Constanta')::INT);
CALL insereaza_in_hotel('Amethyst House'::TEXT,3,'Strada Principala, nr 58'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Otopeni','Ilfov')::INT);
CALL insereaza_in_hotel('Hohe Rinne Paltinis Hotel & Spa'::TEXT,4,'Strada Principala, nr 10'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Fagaras','Brasov')::INT);
CALL insereaza_in_hotel('Hotel Paradis'::TEXT,4,'Strada Principala, nr 130'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Pensiunea Teodora Teleptean'::TEXT,1,'Strada Principala, nr 128'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Viseu de Sus','Maramures')::INT);
CALL insereaza_in_hotel('Ivana Apart Hotel'::TEXT,3,'Strada Principala, nr 124'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Oradea','Bihor')::INT);
CALL insereaza_in_hotel('Pensiunea Ioana'::TEXT,3,'Strada Principala, nr 119'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Curtea de Arges','Arges')::INT);
CALL insereaza_in_hotel('Satu Mare City Hotel'::TEXT,4,'Strada Principala, nr 146'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Satu Mare','Satu Mare')::INT);
CALL insereaza_in_hotel('Pensiunea Christiana'::TEXT,1,'Strada Principala, nr 130'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Arad','Arad')::INT);
CALL insereaza_in_hotel('Hotel Arnia'::TEXT,3,'Strada Principala, nr 12'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Iasi','Iasi')::INT);
CALL insereaza_in_hotel('Parliament Hotel'::TEXT,4,'Strada Principala, nr 117'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Levoslav House'::TEXT,4,'Strada Principala, nr 33'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Sibiu','Sibiu')::INT);
CALL insereaza_in_hotel('Little Texas'::TEXT,4,'Strada Principala, nr 99'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Iasi','Iasi')::INT);
CALL insereaza_in_hotel('Hotel Escalade Poiana Brasov'::TEXT,4,'Strada Principala, nr 73'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Toparceanu Vila'::TEXT,3,'Strada Principala, nr 84'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Pleiada Boutique Hotel'::TEXT,5,'Strada Principala, nr 59'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Iasi','Iasi')::INT);
CALL insereaza_in_hotel('Marshal Garden Hotel'::TEXT,5,'Strada Principala, nr 147'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bucuresti','Bucuresti')::INT);
CALL insereaza_in_hotel('Casa Vacanza Brasov'::TEXT,3,'Strada Principala, nr 50'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Helen Hotel Bacau'::TEXT,4,'Strada Principala, nr 58'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Bacau','Bacau')::INT);
CALL insereaza_in_hotel('Continental Forum Arad'::TEXT,4,'Strada Principala, nr 21'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Arad','Arad')::INT);
CALL insereaza_in_hotel('Hotel Select Iasi'::TEXT,4,'Strada Principala, nr 60'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Iasi','Iasi')::INT);
CALL insereaza_in_hotel('Hotel Coroana Brasovului'::TEXT,3,'Strada Principala, nr 68'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Central Plaza Hotel'::TEXT,4,'Strada Principala, nr 22'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Brasov','Brasov')::INT);
CALL insereaza_in_hotel('Pension Bellagio'::TEXT,4,'Strada Principala, nr 102'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Opera Plaza Hotel'::TEXT,5,'Strada Principala, nr 52'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Del Corso Hotel'::TEXT,3,'Strada Principala, nr 124'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Timisoara','Timis')::INT);
CALL insereaza_in_hotel('Casa Muntean'::TEXT,1,'Strada Principala, nr 75'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Viseu de Sus','Maramures')::INT);
CALL insereaza_in_hotel('Hotel Beyfin'::TEXT,4,'Strada Principala, nr 101'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Cluj Napoca','Cluj')::INT);
CALL insereaza_in_hotel('Lotus Therm Spa & Luxury Resort'::TEXT,5,'Strada Principala, nr 91'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Baile Herculane','Caras-Severin')::INT);


-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('bernard_noble', 'kr1O2h8', 'Bernard Noble', '+40 710 024 027', 'kstoltenberg@yahoo.com', '1930512378945');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('isis_saunders', 'PA3pnYV', 'Isis Saunders', '+40 713 721 929', 'orn.skye@huels.com', '2930705489563');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('micaela_gillespie', 'G7fSXy8', 'Micaela Gillespie', '+40 713 037 240', 'stuart22@yahoo.com', '2930212489215');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('gilbert_mccarty', 'ek1Rwcq', 'Gilbert Mccarty', '+40 711 666 147', 'gskiles@altenwerth.com', '1950624365458');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('harmony_ramirez', 'MOqsV7k', 'Harmony Ramirez', '+40 702 003 043', 'wfranecki@farrell.com', '2900628392547');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('noelle_schroeder', 'd2Au0dz', 'Noelle Schroeder', '+40 702 067 475', 'yasmeen86@hotmail.com', '2920702390517');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('nathaly_bryan', 'uaVkX6B', 'Nathaly Bryan', '+40 702 088 783', 'arne.williamson@yahoo.com', '1961021357496');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('melissa_mercado', 'c2SMIX0', 'Melissa Mercado', '+40 702 082 200', 'wilfredo96@wehner.com', '2941126371239');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('karma_haynes', 'Z1VJJkz', 'Karma Haynes', '+40 702 096 185', 'xhomenick@gmail.com', '1961007397128');

-- INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
-- VALUES ('lyla_gill', 'ToP7Pww', 'Lyla Gill', '+40 707 906 743', 'marlen.collins@hotmail.com', '1920407312546');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('bernard_noble', 'kr1O2h8', 'Bernard Noble', '+40 710 024 027', 'kstoltenberg@yahoo.com', '1930512378945', 'RO1234567890123456789012');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('isis_saunders', 'PA3pnYV', 'Isis Saunders', '+40 713 721 929', 'orn.skye@huels.com', '2930705489563', 'RO2345678901234567890123');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('micaela_gillespie', 'G7fSXy8', 'Micaela Gillespie', '+40 713 037 240', 'stuart22@yahoo.com', '2930212489215', 'RO3456789012345678901234');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('gilbert_mccarty', 'ek1Rwcq', 'Gilbert Mccarty', '+40 711 666 147', 'gskiles@altenwerth.com', '1950624365458', 'RO4567890123456789012345');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('harmony_ramirez', 'MOqsV7k', 'Harmony Ramirez', '+40 702 003 043', 'wfranecki@farrell.com', '2900628392547', 'RO5678901234567890123456');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('noelle_schroeder', 'd2Au0dz', 'Noelle Schroeder', '+40 702 067 475', 'yasmeen86@hotmail.com', '2920702390517', 'RO6789012345678901234567');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('nathaly_bryan', 'uaVkX6B', 'Nathaly Bryan', '+40 702 088 783', 'arne.williamson@yahoo.com', '1961021357496', 'RO7890123456789012345678');

INSERT INTO client (nume_utilizator, hash_parola, nume_complet, telefon, email, cnp, iban)
VALUES ('melissa_mercado', 'c2SMIX0', 'Melissa Mercado', '+40 702 082 200', 'wilfredo96@wehner.com', '2941126371239', 'RO8901234567890123456789');

INSERT INTO tip_camera (nr_paturi_duble, nr_paturi_simple) VALUES (2, 1);
INSERT INTO tip_camera (nr_paturi_duble, nr_paturi_simple) VALUES (3, 2);
INSERT INTO tip_camera (nr_paturi_duble, nr_paturi_simple) VALUES (1, 1);
INSERT INTO tip_camera (nr_paturi_duble, nr_paturi_simple) VALUES (2, 0);

COMMIT;