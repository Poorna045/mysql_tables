import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Injectable, Output, EventEmitter } from '@angular/core'; 
import { Observable, Subscription } from 'rxjs/Rx';
import { AppSettings } from '../app.settings';

@Injectable()
export class ApiService {

    // variables used across components 
    hierarchy;              // contains hierarcy with ordering
    hierarchyArray = [];         // array created from hierarchy object for looping

    selectAlert = true;
    did: Number;
    mid: Number;
    type: String;
    limit: Number;
    param: String;
    dtm: any;
    reportType: String = 'act_power';
    livePage: String;
    // global subscriptions
    LiveDataTimer;
    LiveGraphTimer;
    LiveTableTimer;
    NotificationTimer;
    newPoint = '';
    start_dt = '';
    end_dt = '';
    wihToggle = false;
    isRequesting = false;
    pieChart = '';
    month;
    year;
    status_data;
    firstMonth:string;
    firstYear:string;
    firstDate:string;
    tariffDate: string;
    constructor(private _http: Http) { }

    // get hierarchy of the project, will be first used to display the left sidebar

    unsubscribe() {
        if (this.LiveDataTimer) {
            this.LiveDataTimer.unsubscribe();
        }
        if (this.LiveGraphTimer) {
            this.LiveGraphTimer.unsubscribe();
        }
        if (this.LiveTableTimer) {
            this.LiveTableTimer.unsubscribe();
        }
       
        this.newPoint = '';
    }


    // return list of centers,panels and locations. used to create left side bar
    getAllNodes(did) {
        return this.callApi(AppSettings.NODES_API, 'post', {center_id: did});
    }

    // return defalut node
    getDefaultNode() {
        return this.callApi(AppSettings.DEFAULT_NODES_API, 'post', null);
    }

    // return latest meter data
    getLatestDataByMeter() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type
        };
        return this.callApi(AppSettings.LATEST_DATA_API, 'post', body);
    }

    getLoadDistribution() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type
        };
        console.log(body);
        return this.callApi(AppSettings.LOAD_DIST_API, 'post', body);
    }

    getLiveGraph() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
            'limit': this.limit,
            'param': this.reportType
        };
        console.log(body);
        return this.callApi(AppSettings.LIVE_GRAPH_API, 'post', body);
    }

    getLiveData() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
            'limit': AppSettings.LIVE_DATA_LIMIT_POINTS,
        };
        console.log(body);
        return this.callApi(AppSettings.LIVE_DATA_API, 'post', body);
    }

    getPowerQualityByRangeAndId() {

        const body = {
            'dtm': JSON.stringify(this.dtm),
            'start_dt': this.start_dt,
            'end_dt': this.end_dt,
            'param': this.reportType,
            'pie': this.pieChart
        };
        console.log(AppSettings.POWERQUALITY_API + ' ' + body);
        return this.callApi(AppSettings.POWERQUALITY_API, 'post', body);
    }

    comparePowerQuality() {
        const body = {
            'did': this.dtm[0][0],
            'mid': this.dtm[0][2],
            'type': this.dtm[0][1],
            'day1': this.start_dt,
            'day2': this.end_dt,
            'param': this.reportType,
        };
        console.log(body);
        return this.callApi(AppSettings.COMPARE_POWERQUALITY_API, 'post', body);
    }

    defaultStartDate() {
        return this.callApi(AppSettings.DEFAULT_DATE_API, 'post', null);
    }

    getPowerQualityData() {

        const body = {
            'dtm': JSON.stringify(this.dtm),
            'start_dt': this.start_dt,
            'end_dt': this.end_dt,
            'param': this.reportType,
        };
        return this.callApi(AppSettings.PQ_PDF_EXPORT_API, 'post', body);
    }

    costConsumptionReport() {

        const body = {
            'dtm': JSON.stringify(this.dtm),
            'start_dt': this.start_dt,
            'end_dt': this.end_dt,
            'param': this.reportType,
        };

        return this.callApi(AppSettings.COST_CONSUMPTION_API, 'post', body);
    }

    costConsumptionCompareReport() {
        const body = {
            'did': this.dtm[0][0],
            'mid': this.dtm[0][2],
            'type': this.dtm[0][1],
            'day1': this.start_dt,
            'day2': this.end_dt,
            'param': this.reportType,
        };
        console.log(body);
        return this.callApi(AppSettings.COMPARE_COST_CONSUMPTION_API, 'post', body);
    }

    trendAnalytics() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
            'start_dt': this.start_dt,
        };
        console.log(body+' '+ AppSettings.TREND_ANALYTICS_API);
        return this.callApi(AppSettings.TREND_ANALYTICS_API, 'post', body);
    }

     esoReport() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
            'month': this.month,
            'year': this.year,
        };
        console.log(body+' '+ AppSettings.ESO_API);
        return this.callApi(AppSettings.ESO_API, 'post', body);
    }

    wastageAnalytics(){
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
            'month': this.month,
            'year': this.year,
            'status_data': this.status_data
        };
        console.log(body+' '+ AppSettings.WASTAGE_ANALYTICS_API);
        return this.callApi(AppSettings.WASTAGE_ANALYTICS_API, 'post', body);
    }

    profile(){
        return this.callApi(AppSettings.PROFILE_API, 'post', null);
    }

    changePassword(dbpwd, curpwd) {
        const body = {
            'old_pass': dbpwd,
            'new_pass': curpwd, 
        };
        console.log(body + ' ' + AppSettings.CHANGE_PASSWORD_API);
        return this.callApi(AppSettings.CHANGE_PASSWORD_API, 'post', body);
    }

    nameByDidType() {
        const body = {
            'did': this.did,
            'mid': this.mid,
            'type': this.type,
        };
        console.log(body + ' ' + AppSettings.NAMEDID_TYPE_API);
        return this.callApi(AppSettings.NAMEDID_TYPE_API, 'post', body);
    }

    getNotifications() {
         return this.callApi(AppSettings.NOTIFICATION_API, 'post', null);
    }

    getNotificationsConfigs() {
        return this.callApi(AppSettings.NOTIFICATION_CONFIG_API, 'post', null);
    }

    saveNotificationsConfigs(data:any) {        
        return this.callApi(AppSettings.NOTIFICATION_SAVE_CONFIG_API, 'post', data);
    }

    notificationConfigById(id) {
        const body = {
            'acid': id
        };
        return this.callApi(AppSettings.NOTIFICATION_VIEW_API, 'post', body);
    }

    updateNotificationsConfigs(data:any) {
          return this.callApi(AppSettings.NOTIFICATION_UPDATE_CONFIG_API, 'post', data);
    }

    deleteNotificationsConfigs(id) {
        const body = {
             'acid': id
        };
        return this.callApi(AppSettings.NOTIFICATION_DELETE_CONFIG_API, 'post', body);
    }

    getMetersList() {
        return this.callApi(AppSettings.METERS_LIST_API, 'post', null);
    }

    nNotificationsCount(){
        return this.callApi(AppSettings.NOTIFICATION_COUNT_CONFIG_API, 'post', null);
    }

    viewNotifications(){
         return this.callApi(AppSettings.NOTIFICATION_COUNT_VIEW_API, 'post', null);
    }

    getTariffs() {
         return this.callApi(AppSettings.TARIFFS_LIST_API, 'post', null);
    } 

    getTariffsData(tariff_dt) {
        const body = {
            'tariff_dt': tariff_dt
        };
        return this.callApi(AppSettings.TARIFFS_VIEW_API, 'post', body);
    } 

    getTariffsUpdate(tariff_dt,tariffData,tariffCost) {
        const body = {
            'tariff_dt': tariff_dt,
            'tariff_data': tariffData,
            'cost_data': tariffCost
        };
        return this.callApi(AppSettings.TARIFFS_UPDATE_API, 'post', body);
    }

    getTariffsSave(tariff_dt, tariffData, tariffCost) {
        const body = {
            'tariff_dt': tariff_dt,
            'tariff_data': tariffData,
            'cost_data': tariffCost
        };
        return this.callApi(AppSettings.TARIFFS_ADD_API, 'post', body);
    }

    getCurrentTariffAnalytics() {
        const body = {
            'did': this.did,
            'type': this.type, 
        };
        return this.callApi(AppSettings.CURRENT_TARIFFANALYTICS_API, 'post', body);
    }

    getTariffAnalytics(tariffData, tariffCost) {
        const body = {
            'did': this.did,
            'type': this.type,
            'tariff_data': tariffData,
            'cost_data': tariffCost
        };
        return this.callApi(AppSettings.TARIFFANALYTICS_API, 'post', body);
    }

 

    // responsible for making api calls
    callApi(url: string, method: string, body: Object): Observable<any> {
        console.log(`Http call - url: ${url}, body: ${JSON.stringify(body)}`);

        const headers = new Headers({ 'Content-Type': 'application/json' });
        const options = new RequestOptions({ headers: headers });

        // if user is logged in, append token to header
        if (localStorage.getItem('currentUser')) {
            headers.append('token', localStorage.getItem('currentUser'));
        }

        switch (method) {
            case 'post': return this._http.post(url, body, options).map((response: Response) => response.json());
            case 'get': return this._http.get(url, options).map((response: Response) => response.json());
        }
    }
}
