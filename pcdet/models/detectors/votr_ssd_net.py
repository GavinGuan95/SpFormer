import torch
from .detector3d_template import Detector3DTemplate
import timeit
from ..backbones_3d.votr_backbone import VoxelTransformer

class VoTrSSD(Detector3DTemplate):
    def __init__(self, model_cfg, num_class, dataset):
        super().__init__(model_cfg=model_cfg, num_class=num_class, dataset=dataset)
        self.module_list = self.build_networks()
        self.votr_time = 0
        self.time_list = []

    def forward(self, batch_dict):
        for cur_module in self.module_list:
            if isinstance(cur_module, VoxelTransformer):
                torch.cuda.synchronize()
                start_time = timeit.default_timer()
            batch_dict = cur_module(batch_dict)
            if isinstance(cur_module, VoxelTransformer):
                torch.cuda.synchronize()
                end_time = timeit.default_timer()
                self.time_list.append(end_time - start_time)

        if self.training:
            loss, tb_dict, disp_dict = self.get_training_loss()

            ret_dict = {
                'loss': loss
            }
            return ret_dict, tb_dict, disp_dict
        else:
            pred_dicts, recall_dicts = self.post_processing(batch_dict)
            return pred_dicts, recall_dicts

    def get_training_loss(self):
        disp_dict = {}

        loss_rpn, tb_dict = self.dense_head.get_loss()
        tb_dict = {
            'loss_rpn': loss_rpn.item(),
            **tb_dict
        }

        loss = loss_rpn
        return loss, tb_dict, disp_dict