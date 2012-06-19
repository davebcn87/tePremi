//
//  contenidorsViewController.m
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "contenidorsViewController.h"

#import "detailContenidorViewController.h"

@interface contenidorsViewController ()

@end

@implementation contenidorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction) yellow:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
        [detailContenidorVC setIImageName:@"groc.png"];
    [detailContenidorVC setITitleText:@"Envasos"];
    [detailContenidorVC setISubtitleText:@"El groc: envasos de plàstic, brics i llaunes"];
    [detailContenidorVC setIDescriptionText:@"Els envasos es porten a les plantes de triatge, on se separen els diferents materials mitjançant la combinació de tècniques òptiques, mecàniques i manuals. Els diversos materials seleccionats són compactats, embalats i distribuïts als centres de reciclatge.\n\nAmb els brics es fabriquen bosses de paper, làmines d'alumini o cartró, taulons d'aglomerat, cartró per a envasos, paper de cuina, etc. Les llaunes d'acer es fonen per ser utilitzades en el sector de l'automòbil. Amb les llaunes d'alumini es fan bicicletes, electrodomèstics, cargols, etc., i amb els envasos de plàstic es fabriquen bosses de plàstic, mobiliari urbà, senyalització, roba, caixes o altres envasos per a usos no alimentaris (lleixiu, detergents, etc.).\n\nEl que s'hi pot llençar: envasos de plàstic (garrafes d'aigua, bosses de plàstic, envasos de iogurt, etc.), llaunes de begudes i conserves, brics, xapes i tapes de metall, paper d'alumini i film transparent, safates de porexpan...\n\nEl que no s'hi pot llençar: joguines, mànegues de regar, tubs, materials com cintes de vídeo i CD, i envasos de productes perillosos (com dissolvents o pintures), que s'han de dur als punts verds de la ciutat."];
    [self presentModalViewController:detailContenidorVC animated:YES];
}

- (IBAction) verd:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
        [detailContenidorVC setIImageName:@"verd.png"];
    [detailContenidorVC setITitleText:@"Vidre"];
    [detailContenidorVC setISubtitleText:@"El verd: vidre"];
    [detailContenidorVC setIDescriptionText:@"El vidre recollit selectivament es duu a la planta de reciclatge, on es neteja, se n'extreuen els materials fèrrics amb uns imants i es tritura fins a convertir-lo en pols (vidre seleccionat, net i mòlt), cosa que permet fabricar envasos de vidre exactament iguals que els originals per fer ampolles, pots, bombetes, etc.\n\nEl que s'hi pot llençar: envasos i ampolles de vidre.\n\n     El que no s'hi pot llençar: vasos trencats, vidres plans, miralls, restes de ceràmica, plats, bombetes, fluorescents, etc., que s'han de dur als punts verds de la ciutat."];
    [self presentModalViewController:detailContenidorVC animated:YES];
}

- (IBAction) blau:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
        [detailContenidorVC setIImageName:@"blau.png"];
    [detailContenidorVC setITitleText:@"Paper i cartró"];
    [detailContenidorVC setISubtitleText:@"El blau: paper i cartró"];
    [detailContenidorVC setIDescriptionText:@"El paper i el cartró es porten a les plantes de reciclatge, on es converteixen en grans bales de paper triturat. Aquestes bales es posen en remull per obtenir pasta de paper, que es cola per filtrar-ne els materials fèrrics. La pasta resultant s'asseca, es planxa i se'n fan bobines, que es distribueixen a les fàbriques papereres, on s'utilitzen per fer noves capses, paper d'embalatge, sacs per a la construcció, objectes de papereria i, fins i tot, paper higiènic.\n\nEl que s'hi pot llençar: envasos i caixes de cartró, diaris, revistes, llibretes sense espiral metàl·lica, sobres, bosses de paper, folis, paper de regal, etc.\n\nEl que no s'hi pot llençar: paper i material brut, com ara tovallons de paper o paper de cuina tacats d'oli, que van al contenidor marró. Els brics i el paper d'alumini van al contenidor groc. Les capses de cartró de les pizzes a domicili van al contenidor gris."];
    [self presentModalViewController:detailContenidorVC animated:YES];
}

- (IBAction) marro:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
        [detailContenidorVC setIImageName:@"marro.png"];
    [detailContenidorVC setITitleText:@"Orgànic"];
    [detailContenidorVC setISubtitleText:@"El marró: residus orgànics"];
    [detailContenidorVC setIDescriptionText:@"Són residus de matèria orgànica les substàncies d'origen vegetal i/o animal susceptibles de degradar-se biològicament, com les restes de menjar i de jardineria. És una fracció de residus molt rellevant, ja que constitueix la tercera part dels residus que generem a la nostra llar.\n\n Els residus de matèria orgànica i les restes de poda municipal es duen als ecoparcs, on es converteixen en compost i en biogàs. La fracció orgànica de més qualitat s'utilitza per obtenir compost, que es pot fer servir com a adob orgànic en l'agricultura i la jardineria o com a estructurador de sòlids per restaurar espais degradats. L'altra part de la fracció orgànica s'utilitza per generar biogàs, una energia renovable que permet produir electricitat.\n\nEl que s'hi pot llençar: restes de carn, peix, pa, fruita, verdura, marisc i fruita seca, closques d'ou, taps de suro, bosses d'infusió, marro del cafè, paper de cuina i tovallons tacats d'oli, restes de jardineria, etc.\n\nEl que no s'hi pot llençar: restes d'escombrar, cabells, bolquers i excrements d'animals, que van al contenidor gris. Paper i cartró, que van al contenidor blau."];
    [self presentModalViewController:detailContenidorVC animated:YES];
}

- (IBAction) gris:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
        [detailContenidorVC setIImageName:@"gris.png"];
    [detailContenidorVC setITitleText:@"Rebuig"];
    [detailContenidorVC setISubtitleText:@"El gris: rebuig"];
    [detailContenidorVC setIDescriptionText:@"La fracció resta o rebuig inclou tots els residus que no s'han recollit de manera selectiva. Aquests residus es duen als ecoparcs, on mitjançant diversos processos se separen el paper/cartró, els envasos, el vidre i altres materials, per incorporar-los a la cadena de reciclatge. Els residus que no poden ser reciclats han d'anar als abocadors o han de ser incinerats.\n\n L'idoni és que aquests tractaments finalistes serveixin únicament per als residus que no es poden reutilitzar o reciclar, però les limitacions de la recollida i dels tractaments existents fan que aquestes infraestructures siguin necessàries.\n\nEl que s'hi pot llençar: burilles, compreses, bolquers, restes d'escombrar, cotó, cabells, bolígrafs i llapis usats, excrements d'animals.\n\nEl que no s'hi pot llençar: bosses d'infusió, paper de cuina brut d'oli i restes de menjar (closques d'ou o de marisc, etc.), que van al contenidor marró. Restes de fusta, CD, envasos que contenen materials tòxics i perillosos o roba, que van al punt verd."];
    [self presentModalViewController:detailContenidorVC animated:YES];
}

- (IBAction) puntverd:(id)sender
{
    detailContenidorViewController *detailContenidorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailContenidor"];
    
    [detailContenidorVC setITitleText:@"Punt Verd"];
    [detailContenidorVC setIImageName:@"puntverd.png"];
    [detailContenidorVC setISubtitleText:@"Què és un Punt verd?"];
    [detailContenidorVC setIDescriptionText:@"Els punts verds serveixen per desfer-nos dels residus que no podem llençar als contenidors que trobem al carrer. Utilitzant els punts verds contribuïm a millorar el procés de reciclatge i ajudem a preservar el medi ambient.\n\nPunt verd de zona\n\nPunt verd de barri\n\nPunt verd mòbil\n\nPunt verd mòbil escolar i elèctric"];
    [self presentModalViewController:detailContenidorVC animated:YES];
}


@end
